# typed: strong

module ArkEmail
  module Models
    module Tenants
      class UsageRetrieveTimeseriesResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::UsageRetrieveTimeseriesResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        # Timeseries usage statistics
        sig { returns(ArkEmail::Tenants::TenantUsageTimeseries) }
        attr_reader :data

        sig do
          params(data: ArkEmail::Tenants::TenantUsageTimeseries::OrHash).void
        end
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
            data: ArkEmail::Tenants::TenantUsageTimeseries::OrHash,
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
              data: ArkEmail::Tenants::TenantUsageTimeseries,
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
end
