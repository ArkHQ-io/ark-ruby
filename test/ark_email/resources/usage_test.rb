# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::UsageTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.usage.retrieve

    assert_pattern do
      response => ArkEmail::Models::UsageRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::LimitsData,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_export
    response = @ark.usage.export

    assert_pattern do
      response => ^(ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::UsageExportResponseItem])
    end
  end

  def test_list_by_tenant
    response = @ark.usage.list_by_tenant

    assert_pattern do
      response => ArkEmail::Internal::OffsetPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::BulkTenantUsage::Tenant
    end

    assert_pattern do
      row => {
        emails: ArkEmail::EmailCounts,
        rates: ArkEmail::EmailRates,
        status: ArkEmail::BulkTenantUsage::Tenant::Status,
        tenant_id: String,
        tenant_name: String,
        external_id: String | nil
      }
    end
  end

  def test_retrieve_tenant_timeseries
    response = @ark.usage.retrieve_tenant_timeseries("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::UsageRetrieveTenantTimeseriesResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::TenantUsageTimeseries,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve_tenant_usage
    response = @ark.usage.retrieve_tenant_usage("cm6abc123def456")

    assert_pattern do
      response => ArkEmail::Models::UsageRetrieveTenantUsageResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::TenantUsage,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
