# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Usage#retrieve
      class UsageRetrieveResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #   Tenant usage statistics
        #
        #   @return [ArkEmail::Models::Tenants::TenantUsage]
        required :data, -> { ArkEmail::Tenants::TenantUsage }

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
        #   @param data [ArkEmail::Models::Tenants::TenantUsage] Tenant usage statistics
        #
        #   @param meta [ArkEmail::Models::APIMeta]
        #
        #   @param success [Boolean, true]
      end
    end
  end
end
