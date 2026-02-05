# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#list_tenants
    class TenantUsageItem < ArkEmail::Internal::Type::BaseModel
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
      #   @return [Symbol, ArkEmail::Models::TenantUsageItem::Status]
      required :status, enum: -> { ArkEmail::TenantUsageItem::Status }

      # @!attribute tenant_id
      #   Unique tenant identifier
      #
      #   @return [String]
      required :tenant_id, String, api_name: :tenantId

      # @!attribute tenant_name
      #   Tenant display name
      #
      #   @return [String]
      required :tenant_name, String, api_name: :tenantName

      # @!attribute external_id
      #   Your external ID for this tenant
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId, nil?: true

      # @!method initialize(emails:, rates:, status:, tenant_id:, tenant_name:, external_id: nil)
      #   Usage record for a single tenant (camelCase for SDK)
      #
      #   @param emails [ArkEmail::Models::EmailCounts] Email delivery counts
      #
      #   @param rates [ArkEmail::Models::EmailRates] Email delivery rates (as decimals, e.g., 0.95 = 95%)
      #
      #   @param status [Symbol, ArkEmail::Models::TenantUsageItem::Status] Current tenant status
      #
      #   @param tenant_id [String] Unique tenant identifier
      #
      #   @param tenant_name [String] Tenant display name
      #
      #   @param external_id [String, nil] Your external ID for this tenant

      # Current tenant status
      #
      # @see ArkEmail::Models::TenantUsageItem#status
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
