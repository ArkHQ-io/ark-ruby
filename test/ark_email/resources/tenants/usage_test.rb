# frozen_string_literal: true

require_relative "../../test_helper"

class ArkEmail::Test::Resources::Tenants::UsageTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.tenants.usage.retrieve("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::UsageRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenants::TenantUsage,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_timeseries
    response = @ark.tenants.usage.retrieve_timeseries("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::Tenants::UsageRetrieveTimeseriesResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Tenants::TenantUsageTimeseries,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
