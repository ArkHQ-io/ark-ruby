# typed: strong

module ArkEmail
  module Models
    class BulkTenantUsage < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::BulkTenantUsage, ArkEmail::Internal::AnyHash)
        end

      # Pagination information for usage queries
      sig { returns(ArkEmail::BulkTenantUsage::Pagination) }
      attr_reader :pagination

      sig do
        params(pagination: ArkEmail::BulkTenantUsage::Pagination::OrHash).void
      end
      attr_writer :pagination

      # Time period for usage data
      sig { returns(ArkEmail::UsagePeriod) }
      attr_reader :period

      sig { params(period: ArkEmail::UsagePeriod::OrHash).void }
      attr_writer :period

      # Aggregate summary across all tenants
      sig { returns(ArkEmail::BulkTenantUsage::Summary) }
      attr_reader :summary

      sig { params(summary: ArkEmail::BulkTenantUsage::Summary::OrHash).void }
      attr_writer :summary

      # Array of tenant usage records
      sig { returns(T::Array[ArkEmail::BulkTenantUsage::Tenant]) }
      attr_accessor :tenants

      # Bulk tenant usage data with pagination
      sig do
        params(
          pagination: ArkEmail::BulkTenantUsage::Pagination::OrHash,
          period: ArkEmail::UsagePeriod::OrHash,
          summary: ArkEmail::BulkTenantUsage::Summary::OrHash,
          tenants: T::Array[ArkEmail::BulkTenantUsage::Tenant::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Pagination information for usage queries
        pagination:,
        # Time period for usage data
        period:,
        # Aggregate summary across all tenants
        summary:,
        # Array of tenant usage records
        tenants:
      )
      end

      sig do
        override.returns(
          {
            pagination: ArkEmail::BulkTenantUsage::Pagination,
            period: ArkEmail::UsagePeriod,
            summary: ArkEmail::BulkTenantUsage::Summary,
            tenants: T::Array[ArkEmail::BulkTenantUsage::Tenant]
          }
        )
      end
      def to_hash
      end

      class Pagination < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::BulkTenantUsage::Pagination,
              ArkEmail::Internal::AnyHash
            )
          end

        # Whether more pages are available
        sig { returns(T::Boolean) }
        attr_accessor :has_more

        # Maximum items per page
        sig { returns(Integer) }
        attr_accessor :limit

        # Number of items skipped
        sig { returns(Integer) }
        attr_accessor :offset

        # Total number of tenants matching the query
        sig { returns(Integer) }
        attr_accessor :total

        # Pagination information for usage queries
        sig do
          params(
            has_more: T::Boolean,
            limit: Integer,
            offset: Integer,
            total: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether more pages are available
          has_more:,
          # Maximum items per page
          limit:,
          # Number of items skipped
          offset:,
          # Total number of tenants matching the query
          total:
        )
        end

        sig do
          override.returns(
            {
              has_more: T::Boolean,
              limit: Integer,
              offset: Integer,
              total: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Summary < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::BulkTenantUsage::Summary,
              ArkEmail::Internal::AnyHash
            )
          end

        # Total emails delivered across all tenants
        sig { returns(Integer) }
        attr_accessor :total_delivered

        # Total emails sent across all tenants
        sig { returns(Integer) }
        attr_accessor :total_sent

        # Total number of tenants in the query
        sig { returns(Integer) }
        attr_accessor :total_tenants

        # Aggregate summary across all tenants
        sig do
          params(
            total_delivered: Integer,
            total_sent: Integer,
            total_tenants: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Total emails delivered across all tenants
          total_delivered:,
          # Total emails sent across all tenants
          total_sent:,
          # Total number of tenants in the query
          total_tenants:
        )
        end

        sig do
          override.returns(
            {
              total_delivered: Integer,
              total_sent: Integer,
              total_tenants: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Tenant < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::BulkTenantUsage::Tenant,
              ArkEmail::Internal::AnyHash
            )
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
        sig { returns(ArkEmail::BulkTenantUsage::Tenant::Status::TaggedSymbol) }
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

        # Usage record for a single tenant in bulk response
        sig do
          params(
            emails: ArkEmail::EmailCounts::OrHash,
            rates: ArkEmail::EmailRates::OrHash,
            status: ArkEmail::BulkTenantUsage::Tenant::Status::OrSymbol,
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
              status: ArkEmail::BulkTenantUsage::Tenant::Status::TaggedSymbol,
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
            T.type_alias do
              T.all(Symbol, ArkEmail::BulkTenantUsage::Tenant::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              ArkEmail::BulkTenantUsage::Tenant::Status::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              ArkEmail::BulkTenantUsage::Tenant::Status::TaggedSymbol
            )
          ARCHIVED =
            T.let(
              :archived,
              ArkEmail::BulkTenantUsage::Tenant::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[ArkEmail::BulkTenantUsage::Tenant::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
