# typed: strong

module ArkEmail
  module Models
    class UsageListByTenantParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::UsageListByTenantParams, ArkEmail::Internal::AnyHash)
        end

      # Maximum number of tenants to return (1-100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Only include tenants with at least this many emails sent
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_sent

      sig { params(min_sent: Integer).void }
      attr_writer :min_sent

      # Number of tenants to skip for pagination
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      # Time period for usage data. Defaults to current month.
      sig { returns(T.nilable(String)) }
      attr_reader :period

      sig { params(period: String).void }
      attr_writer :period

      # Sort order for results. Prefix with `-` for descending order.
      sig do
        returns(T.nilable(ArkEmail::UsageListByTenantParams::Sort::OrSymbol))
      end
      attr_reader :sort

      sig do
        params(sort: ArkEmail::UsageListByTenantParams::Sort::OrSymbol).void
      end
      attr_writer :sort

      # Filter by tenant status
      sig do
        returns(T.nilable(ArkEmail::UsageListByTenantParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ArkEmail::UsageListByTenantParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Timezone for period calculations (IANA format). Defaults to UTC.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      sig do
        params(
          limit: Integer,
          min_sent: Integer,
          offset: Integer,
          period: String,
          sort: ArkEmail::UsageListByTenantParams::Sort::OrSymbol,
          status: ArkEmail::UsageListByTenantParams::Status::OrSymbol,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum number of tenants to return (1-100)
        limit: nil,
        # Only include tenants with at least this many emails sent
        min_sent: nil,
        # Number of tenants to skip for pagination
        offset: nil,
        # Time period for usage data. Defaults to current month.
        period: nil,
        # Sort order for results. Prefix with `-` for descending order.
        sort: nil,
        # Filter by tenant status
        status: nil,
        # Timezone for period calculations (IANA format). Defaults to UTC.
        timezone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            limit: Integer,
            min_sent: Integer,
            offset: Integer,
            period: String,
            sort: ArkEmail::UsageListByTenantParams::Sort::OrSymbol,
            status: ArkEmail::UsageListByTenantParams::Status::OrSymbol,
            timezone: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Sort order for results. Prefix with `-` for descending order.
      module Sort
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ArkEmail::UsageListByTenantParams::Sort)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SENT =
          T.let(:sent, ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol)
        MINUS_SENT =
          T.let(:"-sent", ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol)
        DELIVERED =
          T.let(
            :delivered,
            ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol
          )
        MINUS_DELIVERED =
          T.let(
            :"-delivered",
            ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol
          )
        BOUNCE_RATE =
          T.let(
            :bounce_rate,
            ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol
          )
        MINUS_BOUNCE_RATE =
          T.let(
            :"-bounce_rate",
            ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol
          )
        NAME =
          T.let(:name, ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol)
        MINUS_NAME =
          T.let(:"-name", ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::UsageListByTenantParams::Sort::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ArkEmail::UsageListByTenantParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            ArkEmail::UsageListByTenantParams::Status::TaggedSymbol
          )
        SUSPENDED =
          T.let(
            :suspended,
            ArkEmail::UsageListByTenantParams::Status::TaggedSymbol
          )
        ARCHIVED =
          T.let(
            :archived,
            ArkEmail::UsageListByTenantParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::UsageListByTenantParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
