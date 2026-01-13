# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::EmailsTest < Ark::Test::ResourceTest
  def test_retrieve
    response = @ark.emails.retrieve("emailId")

    assert_pattern do
      response => Ark::Models::EmailRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailRetrieveResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.emails.list

    assert_pattern do
      response => Ark::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Ark::Models::EmailListResponse
    end

    assert_pattern do
      row => {
        id: String,
        token: String,
        from: String,
        status: Ark::Models::EmailListResponse::Status,
        subject: String,
        timestamp: Float,
        timestamp_iso: Time,
        to: String,
        tag: String | nil
      }
    end
  end

  def test_retrieve_deliveries
    response = @ark.emails.retrieve_deliveries("emailId")

    assert_pattern do
      response => Ark::Models::EmailRetrieveDeliveriesResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailRetrieveDeliveriesResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_retry_
    response = @ark.emails.retry_("emailId")

    assert_pattern do
      response => Ark::Models::EmailRetryResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailRetryResponse::Data | nil,
        success: Ark::Internal::Type::Boolean | nil
      }
    end
  end

  def test_send__required_params
    response =
      @ark.emails.send_(from: "Acme <hello@acme.com>", subject: "Hello World", to: ["user@example.com"])

    assert_pattern do
      response => Ark::Models::EmailSendResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailSendResponse::Data,
        meta: Ark::APIMeta,
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
      response => Ark::Models::EmailSendBatchResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailSendBatchResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_send_raw_required_params
    response =
      @ark.emails.send_raw(data: "data", mail_from: "dev@stainless.com", rcpt_to: ["dev@stainless.com"])

    assert_pattern do
      response => Ark::Models::EmailSendRawResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailSendRawResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end
end
