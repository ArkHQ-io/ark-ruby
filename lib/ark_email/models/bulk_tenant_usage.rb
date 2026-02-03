# frozen_string_literal: true

module ArkEmail
  module Models
    class BulkTenantUsage < ArkEmail::Internal::Type::BaseModel
      # @!attribute pagination
      #   Pagination information for usage queries
      #
      #   @return [ArkEmail::Models::BulkTenantUsage::Pagination]
      required :pagination, -> { ArkEmail::BulkTenantUsage::Pagination }

      # @!attribute period
      #   Time period for usage data
      #
      #   @return [ArkEmail::Models::UsagePeriod]
      required :period, -> { ArkEmail::UsagePeriod }

      # @!attribute summary
      #   Aggregate summary across all tenants
      #
      #   @return [ArkEmail::Models::BulkTenantUsage::Summary]
      required :summary, -> { ArkEmail::BulkTenantUsage::Summary }

      # @!attribute tenants
      #   Array of tenant usage records
      #
      #   @return [Array<ArkEmail::Models::BulkTenantUsage::Tenant>]
      required :tenants, -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::BulkTenantUsage::Tenant] }

      # @!method initialize(pagination:, period:, summary:, tenants:)
      #   Bulk tenant usage data with pagination
      #
      #   @param pagination [ArkEmail::Models::BulkTenantUsage::Pagination] Pagination information for usage queries
      #
      #   @param period [ArkEmail::Models::UsagePeriod] Time period for usage data
      #
      #   @param summary [ArkEmail::Models::BulkTenantUsage::Summary] Aggregate summary across all tenants
      #
      #   @param tenants [Array<ArkEmail::Models::BulkTenantUsage::Tenant>] Array of tenant usage records

      # @see ArkEmail::Models::BulkTenantUsage#pagination
      class Pagination < ArkEmail::Internal::Type::BaseModel
        # @!attribute has_more
        #   Whether more pages are available
        #
        #   @return [Boolean]
        required :has_more, ArkEmail::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum items per page
        #
        #   @return [Integer]
        required :limit, Integer

        # @!attribute offset
        #   Number of items skipped
        #
        #   @return [Integer]
        required :offset, Integer

        # @!attribute total
        #   Total number of tenants matching the query
        #
        #   @return [Integer]
        required :total, Integer

        # @!method initialize(has_more:, limit:, offset:, total:)
        #   Pagination information for usage queries
        #
        #   @param has_more [Boolean] Whether more pages are available
        #
        #   @param limit [Integer] Maximum items per page
        #
        #   @param offset [Integer] Number of items skipped
        #
        #   @param total [Integer] Total number of tenants matching the query
      end

      # @see ArkEmail::Models::BulkTenantUsage#summary
      class Summary < ArkEmail::Internal::Type::BaseModel
        # @!attribute total_delivered
        #   Total emails delivered across all tenants
        #
        #   @return [Integer]
        required :total_delivered, Integer

        # @!attribute total_sent
        #   Total emails sent across all tenants
        #
        #   @return [Integer]
        required :total_sent, Integer

        # @!attribute total_tenants
        #   Total number of tenants in the query
        #
        #   @return [Integer]
        required :total_tenants, Integer

        # @!method initialize(total_delivered:, total_sent:, total_tenants:)
        #   Aggregate summary across all tenants
        #
        #   @param total_delivered [Integer] Total emails delivered across all tenants
        #
        #   @param total_sent [Integer] Total emails sent across all tenants
        #
        #   @param total_tenants [Integer] Total number of tenants in the query
      end

      class Tenant < ArkEmail::Internal::Type::BaseModel
        # @!attribute emails
        #   Email delivery counts
        #
        #   @return [ArkEmail::Models::EmailCounts]
        required :emails, -> { ArkEmail::EmailCounts }

        # @!attribute rates
        #   Email delivery rates (as decimals, e.g., 0.95 = 95%)
        #
        #   @return [ArkEmail::Models::EmailRates]
        required :rates, -> { ArkEmail::EmailRates }

        # @!attribute status
        #   Current tenant status
        #
        #   @return [Symbol, ArkEmail::Models::BulkTenantUsage::Tenant::Status]
        required :status, enum: -> { ArkEmail::BulkTenantUsage::Tenant::Status }

        # @!attribute tenant_id
        #   Unique tenant identifier
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute tenant_name
        #   Tenant display name
        #
        #   @return [String]
        required :tenant_name, String

        # @!attribute external_id
        #   Your external ID for this tenant
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!method initialize(emails:, rates:, status:, tenant_id:, tenant_name:, external_id: nil)
        #   Usage record for a single tenant in bulk response
        #
        #   @param emails [ArkEmail::Models::EmailCounts] Email delivery counts
        #
        #   @param rates [ArkEmail::Models::EmailRates] Email delivery rates (as decimals, e.g., 0.95 = 95%)
        #
        #   @param status [Symbol, ArkEmail::Models::BulkTenantUsage::Tenant::Status] Current tenant status
        #
        #   @param tenant_id [String] Unique tenant identifier
        #
        #   @param tenant_name [String] Tenant display name
        #
        #   @param external_id [String, nil] Your external ID for this tenant

        # Current tenant status
        #
        # @see ArkEmail::Models::BulkTenantUsage::Tenant#status
        module Status
          extend ArkEmail::Internal::Type::Enum

          ACTIVE = :active
          SUSPENDED = :suspended
          ARCHIVED = :archived

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
