# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Tenants::TrackingTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.tenants.tracking.create("cm6abc123def456", domain_id: 123, name: "track")

    assert_pattern do
      response => ArkEmail::Models::Tenants::TrackingCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenants::TrackDomain,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_required_params
    response = @ark.tenants.tracking.retrieve("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::TrackingRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenants::TrackDomain,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_update_required_params
    response = @ark.tenants.tracking.update("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::TrackingUpdateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenants::TrackDomain,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.tenants.tracking.list("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::TrackingListResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::TrackingListResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete_required_params
    response = @ark.tenants.tracking.delete("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::TrackingDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::TrackingDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_verify_required_params
    response = @ark.tenants.tracking.verify("123", tenant_id: "cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::TrackingVerifyResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::Tenants::TrackingVerifyResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
