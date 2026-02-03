# typed: strong

module ArkEmail
  module Models
    class UsageRetrieveTenantTimeseriesResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::UsageRetrieveTenantTimeseriesResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      # Timeseries usage statistics
      sig { returns(ArkEmail::TenantUsageTimeseries) }
      attr_reader :data

      sig { params(data: ArkEmail::TenantUsageTimeseries::OrHash).void }
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Timeseries usage data for a tenant
      sig do
        params(
          data: ArkEmail::TenantUsageTimeseries::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Timeseries usage statistics
        data:,
        meta:,
        success: true
      )
      end

      sig do
        override.returns(
          {
            data: ArkEmail::TenantUsageTimeseries,
            meta: ArkEmail::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
