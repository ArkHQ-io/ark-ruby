# typed: strong

module ArkEmail
  module Models
    class UsageRetrieveTenantUsageResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::UsageRetrieveTenantUsageResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      # Tenant usage statistics
      sig { returns(ArkEmail::TenantUsage) }
      attr_reader :data

      sig { params(data: ArkEmail::TenantUsage::OrHash).void }
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Usage statistics for a single tenant
      sig do
        params(
          data: ArkEmail::TenantUsage::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Tenant usage statistics
        data:,
        meta:,
        success: true
      )
      end

      sig do
        override.returns(
          {
            data: ArkEmail::TenantUsage,
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
