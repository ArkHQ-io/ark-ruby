# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::TenantsTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.tenants.create(name: "Acme Corp")

    assert_pattern do
      response => ArkEmail::Models::TenantCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenant,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.tenants.retrieve("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::TenantRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenant,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_update
    response = @ark.tenants.update("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::TenantUpdateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenant,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tenants.list

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::Tenant
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        metadata: ^(ArkEmail::Internal::Type::HashOf[union: ArkEmail::Tenant::Metadata, nil?: true]),
        name: String,
        status: ArkEmail::Tenant::Status,
        updated_at: Time
      }
    end
  end

  def test_delete
    response = @ark.tenants.delete("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::TenantDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::TenantDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
