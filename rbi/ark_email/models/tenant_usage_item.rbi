# typed: strong

module ArkEmail
  module Models
    class TenantUsageItem < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::TenantUsageItem, ArkEmail::Internal::AnyHash)
        end

      # Email delivery counts
      sig { returns(ArkEmail::EmailCounts) }
      attr_reader :emails

      sig { params(emails: ArkEmail::EmailCounts::OrHash).void }
      attr_writer :emails

      # Email delivery rates (as decimals, e.g., 0.95 = 95%)
      sig { returns(ArkEmail::EmailRates) }
      attr_reader :rates

      sig { params(rates: ArkEmail::EmailRates::OrHash).void }
      attr_writer :rates

      # Current tenant status
      sig { returns(ArkEmail::TenantUsageItem::Status::TaggedSymbol) }
      attr_accessor :status

      # Unique tenant identifier
      sig { returns(String) }
      attr_accessor :tenant_id

      # Tenant display name
      sig { returns(String) }
      attr_accessor :tenant_name

      # Your external ID for this tenant
      sig { returns(T.nilable(String)) }
      attr_accessor :external_id

      # Usage record for a single tenant (camelCase for SDK)
      sig do
        params(
          emails: ArkEmail::EmailCounts::OrHash,
          rates: ArkEmail::EmailRates::OrHash,
          status: ArkEmail::TenantUsageItem::Status::OrSymbol,
          tenant_id: String,
          tenant_name: String,
          external_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Email delivery counts
        emails:,
        # Email delivery rates (as decimals, e.g., 0.95 = 95%)
        rates:,
        # Current tenant status
        status:,
        # Unique tenant identifier
        tenant_id:,
        # Tenant display name
        tenant_name:,
        # Your external ID for this tenant
        external_id: nil
      )
      end

      sig do
        override.returns(
          {
            emails: ArkEmail::EmailCounts,
            rates: ArkEmail::EmailRates,
            status: ArkEmail::TenantUsageItem::Status::TaggedSymbol,
            tenant_id: String,
            tenant_name: String,
            external_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Current tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::TenantUsageItem::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE = T.let(:active, ArkEmail::TenantUsageItem::Status::TaggedSymbol)
        SUSPENDED =
          T.let(:suspended, ArkEmail::TenantUsageItem::Status::TaggedSymbol)
        ARCHIVED =
          T.let(:archived, ArkEmail::TenantUsageItem::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::TenantUsageItem::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
