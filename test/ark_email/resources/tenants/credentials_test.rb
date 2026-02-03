# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Tenants::CredentialsTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.tenants.credentials.create("cm6abc123def456", name: "production-smtp", type: :smtp)

    assert_pattern do
      response => ArkEmail::Models::Tenants::CredentialCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::CredentialCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_required_params
    response = @ark.tenants.credentials.retrieve(123, tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::CredentialRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_update_required_params
    response = @ark.tenants.credentials.update(123, tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::CredentialUpdateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::CredentialUpdateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tenants.credentials.list("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::Models::Tenants::CredentialListResponse
    end

    assert_pattern do
      row => {
        id: Integer,
        created_at: Time,
        hold: ArkEmail::Internal::Type::Boolean,
        last_used_at: Time | nil,
        name: String,
        type: ArkEmail::Models::Tenants::CredentialListResponse::Type,
        updated_at: Time
      }
    end
  end

  def test_delete_required_params
    response = @ark.tenants.credentials.delete(123, tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::CredentialDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::CredentialDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
