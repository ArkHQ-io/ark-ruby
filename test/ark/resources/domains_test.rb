# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::DomainsTest < Ark::Test::ResourceTest
  def test_create_required_params
    response = @ark.domains.create(name: "notifications.myapp.com")

    assert_pattern do
      response => Ark::Models::DomainCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::DomainCreateResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.domains.retrieve("domainId")

    assert_pattern do
      response => Ark::Models::DomainRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::DomainRetrieveResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.domains.list

    assert_pattern do
      response => Ark::Models::DomainListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::DomainListResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.domains.delete("domainId")

    assert_pattern do
      response => Ark::Models::DomainDeleteResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::DomainDeleteResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_verify
    response = @ark.domains.verify("domainId")

    assert_pattern do
      response => Ark::Models::DomainVerifyResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::DomainVerifyResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end
end
