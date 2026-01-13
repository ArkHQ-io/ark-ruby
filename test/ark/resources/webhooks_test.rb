# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::WebhooksTest < Ark::Test::ResourceTest
  def test_create_required_params
    response =
      @ark.webhooks.create(
        events: [:MessageSent, :MessageDeliveryFailed, :MessageBounced],
        name: "My App Webhook",
        url: "https://myapp.com/webhooks/email"
      )

    assert_pattern do
      response => Ark::Models::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookCreateResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.webhooks.retrieve("webhookId")

    assert_pattern do
      response => Ark::Models::WebhookRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookRetrieveResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_update
    response = @ark.webhooks.update("webhookId")

    assert_pattern do
      response => Ark::Models::WebhookUpdateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookUpdateResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.webhooks.list

    assert_pattern do
      response => Ark::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookListResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.webhooks.delete("webhookId")

    assert_pattern do
      response => Ark::Models::WebhookDeleteResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookDeleteResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_test__required_params
    response = @ark.webhooks.test_("webhookId", event: :MessageSent)

    assert_pattern do
      response => Ark::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::WebhookTestResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end
end
