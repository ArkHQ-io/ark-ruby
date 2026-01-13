# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::WebhooksTest < Ark::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @ark.webhooks.create(
        events: [:MessageSent, :MessageDeliveryFailed, :MessageBounced],
        name: "My App Webhook",
        url: "https://myapp.com/webhooks/email"
      )

    assert_pattern do
      response => Ark::WebhookResponse
    end

    assert_pattern do
      response => {
        data: Ark::WebhookResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::WebhookResponse::Success
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @ark.webhooks.retrieve("webhookId")

    assert_pattern do
      response => Ark::WebhookResponse
    end

    assert_pattern do
      response => {
        data: Ark::WebhookResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::WebhookResponse::Success
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @ark.webhooks.update("webhookId")

    assert_pattern do
      response => Ark::WebhookResponse
    end

    assert_pattern do
      response => {
        data: Ark::WebhookResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::WebhookResponse::Success
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @ark.webhooks.list

    assert_pattern do
      response => Ark::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookListResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::WebhookListResponse::Success
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @ark.webhooks.delete("webhookId")

    assert_pattern do
      response => Ark::SuccessResponse
    end

    assert_pattern do
      response => {
        data: Ark::SuccessResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::SuccessResponse::Success
      }
    end
  end

  def test_test__required_params
    skip("Prism tests are disabled")

    response = @ark.webhooks.test_("webhookId", event: :MessageSent)

    assert_pattern do
      response => Ark::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookTestResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::WebhookTestResponse::Success
      }
    end
  end
end
