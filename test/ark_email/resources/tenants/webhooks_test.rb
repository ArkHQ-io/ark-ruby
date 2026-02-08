# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Tenants::WebhooksTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response =
      @ark.tenants.webhooks.create(
        "cm6abc123def456",
        name: "My App Webhook",
        url: "https://myapp.com/webhooks/email"
      )

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_required_params
    response = @ark.tenants.webhooks.retrieve("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_update_required_params
    response = @ark.tenants.webhooks.update("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookUpdateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookUpdateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tenants.webhooks.list("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookListResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookListResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete_required_params
    response = @ark.tenants.webhooks.delete("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list_deliveries_required_params
    response = @ark.tenants.webhooks.list_deliveries("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookListDeliveriesResponse
    end

    assert_pattern do
      response => {
        data: ^(ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::Tenants::WebhookListDeliveriesResponse::Data]),
        meta: ArkEmail::APIMeta,
        page: Integer,
        per_page: Integer,
        total: Integer,
        total_pages: Integer
      }
    end
  end

  def test_replay_delivery_required_params
    response =
      @ark.tenants.webhooks.replay_delivery(
        "whr_abc123def456",
        tenant_id: "cm6abc123def456",
        webhook_id: "123"
      )

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_delivery_required_params
    response =
      @ark.tenants.webhooks.retrieve_delivery(
        "whr_abc123def456",
        tenant_id: "cm6abc123def456",
        webhook_id: "123"
      )

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_test__required_params
    response = @ark.tenants.webhooks.test_("123", tenant_id: "cm6abc123def456", event: :MessageSent)

    assert_pattern do
      response => ArkEmail::Models::Tenants::WebhookTestResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::WebhookTestResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
