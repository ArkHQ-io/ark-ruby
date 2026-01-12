# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::DomainsTest < Ark::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @ark.domains.create(name: "notifications.myapp.com")

    assert_pattern do
      response => Ark::DomainResponse
    end

    assert_pattern do
      response => {
        data: Ark::DomainResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::DomainResponse::Success
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @ark.domains.retrieve("domainId")

    assert_pattern do
      response => Ark::DomainResponse
    end

    assert_pattern do
      response => {
        data: Ark::DomainResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::DomainResponse::Success
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @ark.domains.list

    assert_pattern do
      response => Ark::Models::DomainListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::DomainListResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::DomainListResponse::Success
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @ark.domains.delete("domainId")

    assert_pattern do
      response => Ark::SuccessResponse
    end

    assert_pattern do
      response => {
        data: Ark::SuccessResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::SuccessResponse::Success
      }
    end
  end

  def test_verify
    skip("Prism tests are disabled")

    response = @ark.domains.verify("domainId")

    assert_pattern do
      response => Ark::DomainResponse
    end

    assert_pattern do
      response => {
        data: Ark::DomainResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::DomainResponse::Success
      }
    end
  end
end
