# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Usage#retrieve_timeseries
      class UsageRetrieveTimeseriesResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #   Timeseries usage statistics
        #
        #   @return [ArkEmail::Models::Tenants::TenantUsageTimeseries]
        required :data, -> { ArkEmail::Tenants::TenantUsageTimeseries }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   Timeseries usage data for a tenant
        #
        #   @param data [ArkEmail::Models::Tenants::TenantUsageTimeseries] Timeseries usage statistics
        #
        #   @param meta [ArkEmail::Models::APIMeta]
        #
        #   @param success [Boolean, true]
      end
    end
  end
end
