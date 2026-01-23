# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::EmailsTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.emails.retrieve("emailId")

    assert_pattern do
      response => ArkEmail::Models::EmailRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::EmailRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.emails.list

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::Models::EmailListResponse
    end

    assert_pattern do
      row => {
        id: String,
        token: String,
        from: String,
        status: ArkEmail::Models::EmailListResponse::Status,
        subject: String,
        timestamp: Float,
        timestamp_iso: Time,
        to: String,
        tag: String | nil
      }
    end
  end

  def test_retrieve_deliveries
    response = @ark.emails.retrieve_deliveries("msg_12345_aBc123XyZ")

    assert_pattern do
      response => ArkEmail::Models::EmailRetrieveDeliveriesResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retry_
    response = @ark.emails.retry_("emailId")

    assert_pattern do
      response => ArkEmail::Models::EmailRetryResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::EmailRetryResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_send__required_params
    response =
      @ark.emails.send_(from: "Acme <hello@acme.com>", subject: "Hello World", to: ["user@example.com"])

    assert_pattern do
      response => ArkEmail::Models::EmailSendResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::EmailSendResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_send_batch_required_params
    response =
      @ark.emails.send_batch(
        emails: [
          {subject: "Hello Alice", to: ["alice@example.com"]},
          {subject: "Hello Bob", to: ["bob@example.com"]}
        ],
        from: "notifications@myapp.com"
      )

    assert_pattern do
      response => ArkEmail::Models::EmailSendBatchResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::EmailSendBatchResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_send_raw_required_params
    response =
      @ark.emails.send_raw(from: "dev@stainless.com", raw_message: "rawMessage", to: ["dev@stainless.com"])

    assert_pattern do
      response => ArkEmail::Models::EmailSendRawResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::EmailSendRawResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
