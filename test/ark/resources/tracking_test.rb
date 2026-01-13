# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::TrackingTest < Ark::Test::ResourceTest
  def test_create_required_params
    response = @ark.tracking.create(domain_id: "123", name: "track")

    assert_pattern do
      response => Ark::Models::TrackingCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::TrackDomain,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.tracking.retrieve("trackingId")

    assert_pattern do
      response => Ark::Models::TrackingRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Ark::TrackDomain,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_update
    response = @ark.tracking.update("trackingId")

    assert_pattern do
      response => Ark::Models::TrackingUpdateResponse
    end

    assert_pattern do
      response => {
        data: Ark::TrackDomain,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tracking.list

    assert_pattern do
      response => Ark::Models::TrackingListResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::TrackingListResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.tracking.delete("trackingId")

    assert_pattern do
      response => Ark::Models::TrackingDeleteResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::TrackingDeleteResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_verify
    response = @ark.tracking.verify("trackingId")

    assert_pattern do
      response => Ark::Models::TrackingVerifyResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::TrackingVerifyResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end
end
