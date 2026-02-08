# typed: strong

module ArkEmail
  module Models
    TenantUsageTimeseries = Tenants::TenantUsageTimeseries

    module Tenants
      class TenantUsageTimeseries < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::TenantUsageTimeseries,
              ArkEmail::Internal::AnyHash
            )
          end

        # Array of time-bucketed data points
        sig do
          returns(T::Array[ArkEmail::Tenants::TenantUsageTimeseries::Data])
        end
        attr_accessor :data

        # Time bucket granularity
        sig do
          returns(
            ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol
          )
        end
        attr_accessor :granularity

        # Time period for usage data
        sig { returns(ArkEmail::UsagePeriod) }
        attr_reader :period

        sig { params(period: ArkEmail::UsagePeriod::OrHash).void }
        attr_writer :period

        # Unique tenant identifier
        sig { returns(String) }
        attr_accessor :tenant_id

        # Tenant display name
        sig { returns(String) }
        attr_accessor :tenant_name

        # Timeseries usage statistics
        sig do
          params(
            data:
              T::Array[ArkEmail::Tenants::TenantUsageTimeseries::Data::OrHash],
            granularity:
              ArkEmail::Tenants::TenantUsageTimeseries::Granularity::OrSymbol,
            period: ArkEmail::UsagePeriod::OrHash,
            tenant_id: String,
            tenant_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Array of time-bucketed data points
          data:,
          # Time bucket granularity
          granularity:,
          # Time period for usage data
          period:,
          # Unique tenant identifier
          tenant_id:,
          # Tenant display name
          tenant_name:
        )
        end

        sig do
          override.returns(
            {
              data: T::Array[ArkEmail::Tenants::TenantUsageTimeseries::Data],
              granularity:
                ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol,
              period: ArkEmail::UsagePeriod,
              tenant_id: String,
              tenant_name: String
            }
          )
        end
        def to_hash
        end

        class Data < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Tenants::TenantUsageTimeseries::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Bounces in this bucket
          sig { returns(Integer) }
          attr_accessor :bounced

          # Emails delivered in this bucket
          sig { returns(Integer) }
          attr_accessor :delivered

          # Hard failures in this bucket
          sig { returns(Integer) }
          attr_accessor :hard_failed

          # Emails held in this bucket
          sig { returns(Integer) }
          attr_accessor :held

          # Emails sent in this bucket
          sig { returns(Integer) }
          attr_accessor :sent

          # Soft failures in this bucket
          sig { returns(Integer) }
          attr_accessor :soft_failed

          # Start of time bucket
          sig { returns(Time) }
          attr_accessor :timestamp

          # Single timeseries data point
          sig do
            params(
              bounced: Integer,
              delivered: Integer,
              hard_failed: Integer,
              held: Integer,
              sent: Integer,
              soft_failed: Integer,
              timestamp: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Bounces in this bucket
            bounced:,
            # Emails delivered in this bucket
            delivered:,
            # Hard failures in this bucket
            hard_failed:,
            # Emails held in this bucket
            held:,
            # Emails sent in this bucket
            sent:,
            # Soft failures in this bucket
            soft_failed:,
            # Start of time bucket
            timestamp:
          )
          end

          sig do
            override.returns(
              {
                bounced: Integer,
                delivered: Integer,
                hard_failed: Integer,
                held: Integer,
                sent: Integer,
                soft_failed: Integer,
                timestamp: Time
              }
            )
          end
          def to_hash
          end
        end

        # Time bucket granularity
        module Granularity
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ArkEmail::Tenants::TenantUsageTimeseries::Granularity
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HOUR =
            T.let(
              :hour,
              ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol
            )
          DAY =
            T.let(
              :day,
              ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol
            )
          WEEK =
            T.let(
              :week,
              ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol
            )
          MONTH =
            T.let(
              :month,
              ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Tenants::TenantUsageTimeseries::Granularity::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
