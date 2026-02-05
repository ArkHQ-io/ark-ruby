# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Usage#retrieve_timeseries
      class UsageRetrieveTimeseriesParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute granularity
        #   Time bucket size for data points
        #
        #   @return [Symbol, ArkEmail::Models::Tenants::UsageRetrieveTimeseriesParams::Granularity, nil]
        optional :granularity, enum: -> { ArkEmail::Tenants::UsageRetrieveTimeseriesParams::Granularity }

        # @!attribute period
        #   Time period for timeseries data. Defaults to current month.
        #
        #   @return [String, nil]
        optional :period, String

        # @!attribute timezone
        #   Timezone for period calculations (IANA format). Defaults to UTC.
        #
        #   @return [String, nil]
        optional :timezone, String

        # @!method initialize(granularity: nil, period: nil, timezone: nil, request_options: {})
        #   @param granularity [Symbol, ArkEmail::Models::Tenants::UsageRetrieveTimeseriesParams::Granularity] Time bucket size for data points
        #
        #   @param period [String] Time period for timeseries data. Defaults to current month.
        #
        #   @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

        # Time bucket size for data points
        module Granularity
          extend ArkEmail::Internal::Type::Enum

          HOUR = :hour
          DAY = :day
          WEEK = :week
          MONTH = :month

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
