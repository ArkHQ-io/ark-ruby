# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#retrieve_tenant_timeseries
    class UsageRetrieveTenantTimeseriesResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #   Timeseries usage statistics
      #
      #   @return [ArkEmail::Models::TenantUsageTimeseries]
      required :data, -> { ArkEmail::TenantUsageTimeseries }

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
      #   @param data [ArkEmail::Models::TenantUsageTimeseries] Timeseries usage statistics
      #
      #   @param meta [ArkEmail::Models::APIMeta]
      #
      #   @param success [Boolean, true]
    end
  end
end
