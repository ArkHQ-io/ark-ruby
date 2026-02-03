# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#retrieve_tenant_usage
    class UsageRetrieveTenantUsageResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #   Tenant usage statistics
      #
      #   @return [ArkEmail::Models::TenantUsage]
      required :data, -> { ArkEmail::TenantUsage }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   Usage statistics for a single tenant
      #
      #   @param data [ArkEmail::Models::TenantUsage] Tenant usage statistics
      #
      #   @param meta [ArkEmail::Models::APIMeta]
      #
      #   @param success [Boolean, true]
    end
  end
end
