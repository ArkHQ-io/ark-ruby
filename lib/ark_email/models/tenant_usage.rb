# frozen_string_literal: true

module ArkEmail
  module Models
    class TenantUsage < ArkEmail::Internal::Type::BaseModel
      # @!attribute emails
      #   Email delivery counts
      #
      #   @return [ArkEmail::Models::EmailCounts]
      required :emails, -> { ArkEmail::EmailCounts }

      # @!attribute period
      #   Time period for usage data
      #
      #   @return [ArkEmail::Models::UsagePeriod]
      required :period, -> { ArkEmail::UsagePeriod }

      # @!attribute rates
      #   Email delivery rates (as decimals, e.g., 0.95 = 95%)
      #
      #   @return [ArkEmail::Models::EmailRates]
      required :rates, -> { ArkEmail::EmailRates }

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
      #   Your external ID for this tenant (from metadata)
      #
      #   @return [String, nil]
      optional :external_id, String, nil?: true

      # @!method initialize(emails:, period:, rates:, tenant_id:, tenant_name:, external_id: nil)
      #   Tenant usage statistics
      #
      #   @param emails [ArkEmail::Models::EmailCounts] Email delivery counts
      #
      #   @param period [ArkEmail::Models::UsagePeriod] Time period for usage data
      #
      #   @param rates [ArkEmail::Models::EmailRates] Email delivery rates (as decimals, e.g., 0.95 = 95%)
      #
      #   @param tenant_id [String] Unique tenant identifier
      #
      #   @param tenant_name [String] Tenant display name
      #
      #   @param external_id [String, nil] Your external ID for this tenant (from metadata)
    end
  end
end
