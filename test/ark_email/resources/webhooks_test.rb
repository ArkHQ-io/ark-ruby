# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::WebhooksTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response =
      @ark.webhooks.create(
        events: [:MessageSent, :MessageDeliveryFailed, :MessageBounced],
        name: "My App Webhook",
        url: "https://myapp.com/webhooks/email"
      )

    assert_pattern do
      response => ArkEmail::Models::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::WebhookCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.webhooks.retrieve("webhookId")

    assert_pattern do
      response => ArkEmail::Models::WebhookRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::WebhookRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_update
    response = @ark.webhooks.update("webhookId")

    assert_pattern do
      response => ArkEmail::Models::WebhookUpdateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::WebhookUpdateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.webhooks.list

    assert_pattern do
      response => ArkEmail::Models::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::WebhookListResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.webhooks.delete("webhookId")

    assert_pattern do
      response => ArkEmail::Models::WebhookDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::WebhookDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_test__required_params
    response = @ark.webhooks.test_("webhookId", event: :MessageSent)

    assert_pattern do
      response => ArkEmail::Models::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::WebhookTestResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
