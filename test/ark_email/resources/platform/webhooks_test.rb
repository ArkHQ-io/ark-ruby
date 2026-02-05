# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Platform::WebhooksTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response =
      @ark.platform.webhooks.create(
        name: "Central Event Processor",
        url: "https://myplatform.com/webhooks/email-events"
      )

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.platform.webhooks.retrieve("pwh_abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_update
    response = @ark.platform.webhooks.update("pwh_abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookUpdateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookUpdateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.platform.webhooks.list

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: ^(ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::Platform::WebhookListResponse::Data]),
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.platform.webhooks.delete("pwh_abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list_deliveries
    response = @ark.platform.webhooks.list_deliveries

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::Models::Platform::WebhookListDeliveriesResponse
    end

    assert_pattern do
      row => {
        id: String,
        attempt: Integer,
        event: ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event,
        status_code: Integer | nil,
        success: ArkEmail::Internal::Type::Boolean,
        tenant_id: String,
        timestamp: Time,
        url: String,
        webhook_id: String,
        will_retry: ArkEmail::Internal::Type::Boolean
      }
    end
  end

  def test_replay_delivery
    response = @ark.platform.webhooks.replay_delivery("pwd_abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookReplayDeliveryResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookReplayDeliveryResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_delivery
    response = @ark.platform.webhooks.retrieve_delivery("pwd_abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_test__required_params
    response = @ark.platform.webhooks.test_("pwh_abc123def456", event: :MessageSent)

    assert_pattern do
      response => ArkEmail::Models::Platform::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Platform::WebhookTestResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
