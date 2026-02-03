# typed: strong

module ArkEmail
  module Models
    class UsageRetrieveTenantTimeseriesParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::UsageRetrieveTenantTimeseriesParams,
            ArkEmail::Internal::AnyHash
          )
        end

      # Time bucket size for data points
      sig do
        returns(
          T.nilable(
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::OrSymbol
          )
        )
      end
      attr_reader :granularity

      sig do
        params(
          granularity:
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::OrSymbol
        ).void
      end
      attr_writer :granularity

      # Time period for timeseries data. Defaults to current month.
      sig { returns(T.nilable(String)) }
      attr_reader :period

      sig { params(period: String).void }
      attr_writer :period

      # Timezone for period calculations (IANA format). Defaults to UTC.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      sig do
        params(
          granularity:
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::OrSymbol,
          period: String,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Time bucket size for data points
        granularity: nil,
        # Time period for timeseries data. Defaults to current month.
        period: nil,
        # Timezone for period calculations (IANA format). Defaults to UTC.
        timezone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            granularity:
              ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::OrSymbol,
            period: String,
            timezone: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Time bucket size for data points
      module Granularity
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HOUR =
          T.let(
            :hour,
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::TaggedSymbol
          )
        DAY =
          T.let(
            :day,
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::TaggedSymbol
          )
        WEEK =
          T.let(
            :week,
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::TaggedSymbol
          )
        MONTH =
          T.let(
            :month,
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
