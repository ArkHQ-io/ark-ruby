# frozen_string_literal: true

module ArkEmail
  module Models
    class TenantUsageTimeseries < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #   Array of time-bucketed data points
      #
      #   @return [Array<ArkEmail::Models::TenantUsageTimeseries::Data>]
      required :data, -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::TenantUsageTimeseries::Data] }

      # @!attribute granularity
      #   Time bucket granularity
      #
      #   @return [Symbol, ArkEmail::Models::TenantUsageTimeseries::Granularity]
      required :granularity, enum: -> { ArkEmail::TenantUsageTimeseries::Granularity }

      # @!attribute period
      #   Time period for usage data
      #
      #   @return [ArkEmail::Models::UsagePeriod]
      required :period, -> { ArkEmail::UsagePeriod }

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

      # @!method initialize(data:, granularity:, period:, tenant_id:, tenant_name:)
      #   Timeseries usage statistics
      #
      #   @param data [Array<ArkEmail::Models::TenantUsageTimeseries::Data>] Array of time-bucketed data points
      #
      #   @param granularity [Symbol, ArkEmail::Models::TenantUsageTimeseries::Granularity] Time bucket granularity
      #
      #   @param period [ArkEmail::Models::UsagePeriod] Time period for usage data
      #
      #   @param tenant_id [String] Unique tenant identifier
      #
      #   @param tenant_name [String] Tenant display name

      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute bounced
        #   Bounces in this bucket
        #
        #   @return [Integer]
        required :bounced, Integer

        # @!attribute delivered
        #   Emails delivered in this bucket
        #
        #   @return [Integer]
        required :delivered, Integer

        # @!attribute hard_failed
        #   Hard failures in this bucket
        #
        #   @return [Integer]
        required :hard_failed, Integer

        # @!attribute held
        #   Emails held in this bucket
        #
        #   @return [Integer]
        required :held, Integer

        # @!attribute sent
        #   Emails sent in this bucket
        #
        #   @return [Integer]
        required :sent, Integer

        # @!attribute soft_failed
        #   Soft failures in this bucket
        #
        #   @return [Integer]
        required :soft_failed, Integer

        # @!attribute timestamp
        #   Start of time bucket
        #
        #   @return [Time]
        required :timestamp, Time

        # @!method initialize(bounced:, delivered:, hard_failed:, held:, sent:, soft_failed:, timestamp:)
        #   Single timeseries data point
        #
        #   @param bounced [Integer] Bounces in this bucket
        #
        #   @param delivered [Integer] Emails delivered in this bucket
        #
        #   @param hard_failed [Integer] Hard failures in this bucket
        #
        #   @param held [Integer] Emails held in this bucket
        #
        #   @param sent [Integer] Emails sent in this bucket
        #
        #   @param soft_failed [Integer] Soft failures in this bucket
        #
        #   @param timestamp [Time] Start of time bucket
      end

      # Time bucket granularity
      #
      # @see ArkEmail::Models::TenantUsageTimeseries#granularity
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
