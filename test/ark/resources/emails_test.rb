# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::EmailsTest < Ark::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

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
    skip("Prism tests are disabled")

    response = @ark.emails.list

    assert_pattern do
      response => Ark::Models::EmailListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailListResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_get_deliveries
    skip("Prism tests are disabled")

    response = @ark.emails.get_deliveries("emailId")

    assert_pattern do
      response => Ark::Models::EmailGetDeliveriesResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::EmailGetDeliveriesResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_retry_
    skip("Prism tests are disabled")

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
    skip("Prism tests are disabled")

    response =
      @ark.emails.send_(from: "Acme <hello@acme.com>", subject: "Hello World", to: ["user@example.com"])

    assert_pattern do
      response => Ark::SendEmail
    end

    assert_pattern do
      response => {
        data: Ark::SendEmail::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_send_batch_required_params
    skip("Prism tests are disabled")

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
    skip("Prism tests are disabled")

    response =
      @ark.emails.send_raw(data: "data", mail_from: "dev@stainless.com", rcpt_to: ["dev@stainless.com"])

    assert_pattern do
      response => Ark::SendEmail
    end

    assert_pattern do
      response => {
        data: Ark::SendEmail::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end
end
