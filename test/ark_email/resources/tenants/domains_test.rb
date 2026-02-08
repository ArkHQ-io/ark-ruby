# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Tenants::DomainsTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.tenants.domains.create("cm6abc123def456", name: "notifications.myapp.com")

    assert_pattern do
      response => ArkEmail::Models::Tenants::DomainCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::DomainCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_required_params
    response = @ark.tenants.domains.retrieve("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::DomainRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::DomainRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tenants.domains.list("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::DomainListResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::DomainListResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete_required_params
    response = @ark.tenants.domains.delete("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::DomainDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::DomainDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_verify_required_params
    response = @ark.tenants.domains.verify("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::DomainVerifyResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::DomainVerifyResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
