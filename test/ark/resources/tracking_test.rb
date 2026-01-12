# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::TrackingTest < Ark::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @ark.tracking.create(domain_id: "123", name: "track")

    assert_pattern do
      response => Ark::TrackDomainResponse
    end

    assert_pattern do
      response => {
        data: Ark::TrackDomain,
        meta: Ark::APIMeta,
        success: Ark::TrackDomainResponse::Success
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @ark.tracking.retrieve("trackingId")

    assert_pattern do
      response => Ark::TrackDomainResponse
    end

    assert_pattern do
      response => {
        data: Ark::TrackDomain,
        meta: Ark::APIMeta,
        success: Ark::TrackDomainResponse::Success
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @ark.tracking.update("trackingId")

    assert_pattern do
      response => Ark::TrackDomainResponse
    end

    assert_pattern do
      response => {
        data: Ark::TrackDomain,
        meta: Ark::APIMeta,
        success: Ark::TrackDomainResponse::Success
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @ark.tracking.list

    assert_pattern do
      response => Ark::Models::TrackingListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::TrackingListResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::TrackingListResponse::Success
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @ark.tracking.delete("trackingId")

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

    response = @ark.tracking.verify("trackingId")

    assert_pattern do
      response => Ark::Models::TrackingVerifyResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::TrackingVerifyResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::TrackingVerifyResponse::Success
      }
    end
  end
end
