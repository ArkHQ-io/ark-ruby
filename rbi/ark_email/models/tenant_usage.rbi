# typed: strong

module ArkEmail
  module Models
    class TenantUsage < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::TenantUsage, ArkEmail::Internal::AnyHash)
        end

      # Email delivery counts
      sig { returns(ArkEmail::EmailCounts) }
      attr_reader :emails

      sig { params(emails: ArkEmail::EmailCounts::OrHash).void }
      attr_writer :emails

      # Time period for usage data
      sig { returns(ArkEmail::UsagePeriod) }
      attr_reader :period

      sig { params(period: ArkEmail::UsagePeriod::OrHash).void }
      attr_writer :period

      # Email delivery rates (as decimals, e.g., 0.95 = 95%)
      sig { returns(ArkEmail::EmailRates) }
      attr_reader :rates

      sig { params(rates: ArkEmail::EmailRates::OrHash).void }
      attr_writer :rates

      # Unique tenant identifier
      sig { returns(String) }
      attr_accessor :tenant_id

      # Tenant display name
      sig { returns(String) }
      attr_accessor :tenant_name

      # Your external ID for this tenant (from metadata)
      sig { returns(T.nilable(String)) }
      attr_accessor :external_id

      # Tenant usage statistics
      sig do
        params(
          emails: ArkEmail::EmailCounts::OrHash,
          period: ArkEmail::UsagePeriod::OrHash,
          rates: ArkEmail::EmailRates::OrHash,
          tenant_id: String,
          tenant_name: String,
          external_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Email delivery counts
        emails:,
        # Time period for usage data
        period:,
        # Email delivery rates (as decimals, e.g., 0.95 = 95%)
        rates:,
        # Unique tenant identifier
        tenant_id:,
        # Tenant display name
        tenant_name:,
        # Your external ID for this tenant (from metadata)
        external_id: nil
      )
      end

      sig do
        override.returns(
          {
            emails: ArkEmail::EmailCounts,
            period: ArkEmail::UsagePeriod,
            rates: ArkEmail::EmailRates,
            tenant_id: String,
            tenant_name: String,
            external_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
