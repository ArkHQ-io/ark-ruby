# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Tenants::SuppressionsTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.tenants.suppressions.create("cm6abc123def456", address: "user@example.com")

    assert_pattern do
      response => ArkEmail::Models::Tenants::SuppressionCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::SuppressionCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_required_params
    response = @ark.tenants.suppressions.retrieve("user@example.com", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::SuppressionRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::SuppressionRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tenants.suppressions.list("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::Models::Tenants::SuppressionListResponse
    end

    assert_pattern do
      row => {
        id: String,
        address: String,
        created_at: Time,
        reason: String | nil
      }
    end
  end

  def test_delete_required_params
    response = @ark.tenants.suppressions.delete("user@example.com", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::SuppressionDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::SuppressionDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
