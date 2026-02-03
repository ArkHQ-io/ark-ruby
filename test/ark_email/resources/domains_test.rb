# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::DomainsTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.domains.create(name: "notifications.myapp.com", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::DomainCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::DomainCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.domains.retrieve("domainId")

    assert_pattern do
      response => ArkEmail::Models::DomainRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::DomainRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.domains.list

    assert_pattern do
      response => ArkEmail::Models::DomainListResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::DomainListResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.domains.delete("domainId")

    assert_pattern do
      response => ArkEmail::Models::DomainDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::DomainDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_verify
    response = @ark.domains.verify("domainId")

    assert_pattern do
      response => ArkEmail::Models::DomainVerifyResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::DomainVerifyResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
