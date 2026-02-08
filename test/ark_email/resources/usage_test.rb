# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::UsageTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.usage.retrieve

    assert_pattern do
      response => ArkEmail::OrgUsageSummary
    end

    assert_pattern do
      response => {
        data: ArkEmail::OrgUsageSummary::Data,
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

  def test_list_tenants
    response = @ark.usage.list_tenants

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::TenantUsageItem
    end

    assert_pattern do
      row => {
        emails: ArkEmail::EmailCounts,
        rates: ArkEmail::EmailRates,
        status: ArkEmail::TenantUsageItem::Status,
        tenant_id: String,
        tenant_name: String,
        external_id: String | nil
      }
    end
  end
end
