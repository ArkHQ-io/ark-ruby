# typed: strong

module ArkEmail
  module Models
    class UsageListTenantsParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::UsageListTenantsParams, ArkEmail::Internal::AnyHash)
        end

      # Only include tenants with at least this many emails sent
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_sent

      sig { params(min_sent: Integer).void }
      attr_writer :min_sent

      # Page number (1-indexed)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Time period for usage data. Defaults to current month.
      #
      # **Shortcuts:** `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
      # `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
      #
      # **Month format:** `2024-01` (YYYY-MM)
      #
      # **Custom range:** `2024-01-01..2024-01-15`
      sig { returns(T.nilable(String)) }
      attr_reader :period

      sig { params(period: String).void }
      attr_writer :period

      # Results per page (max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :per_page

      sig { params(per_page: Integer).void }
      attr_writer :per_page

      # Sort order for results. Prefix with `-` for descending order.
      sig do
        returns(T.nilable(ArkEmail::UsageListTenantsParams::Sort::OrSymbol))
      end
      attr_reader :sort

      sig do
        params(sort: ArkEmail::UsageListTenantsParams::Sort::OrSymbol).void
      end
      attr_writer :sort

      # Filter by tenant status
      sig do
        returns(T.nilable(ArkEmail::UsageListTenantsParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ArkEmail::UsageListTenantsParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Timezone for period calculations (IANA format). Defaults to UTC.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      sig do
        params(
          min_sent: Integer,
          page: Integer,
          period: String,
          per_page: Integer,
          sort: ArkEmail::UsageListTenantsParams::Sort::OrSymbol,
          status: ArkEmail::UsageListTenantsParams::Status::OrSymbol,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Only include tenants with at least this many emails sent
        min_sent: nil,
        # Page number (1-indexed)
        page: nil,
        # Time period for usage data. Defaults to current month.
        #
        # **Shortcuts:** `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
        # `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
        #
        # **Month format:** `2024-01` (YYYY-MM)
        #
        # **Custom range:** `2024-01-01..2024-01-15`
        period: nil,
        # Results per page (max 100)
        per_page: nil,
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
            min_sent: Integer,
            page: Integer,
            period: String,
            per_page: Integer,
            sort: ArkEmail::UsageListTenantsParams::Sort::OrSymbol,
            status: ArkEmail::UsageListTenantsParams::Status::OrSymbol,
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
          T.type_alias { T.all(Symbol, ArkEmail::UsageListTenantsParams::Sort) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SENT =
          T.let(:sent, ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol)
        MINUS_SENT =
          T.let(:"-sent", ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol)
        DELIVERED =
          T.let(
            :delivered,
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        MINUS_DELIVERED =
          T.let(
            :"-delivered",
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        BOUNCE_RATE =
          T.let(
            :bounce_rate,
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        MINUS_BOUNCE_RATE =
          T.let(
            :"-bounce_rate",
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        DELIVERY_RATE =
          T.let(
            :delivery_rate,
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        MINUS_DELIVERY_RATE =
          T.let(
            :"-delivery_rate",
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        TENANT_NAME =
          T.let(
            :tenant_name,
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )
        MINUS_TENANT_NAME =
          T.let(
            :"-tenant_name",
            ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::UsageListTenantsParams::Sort::TaggedSymbol]
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
            T.all(Symbol, ArkEmail::UsageListTenantsParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ArkEmail::UsageListTenantsParams::Status::TaggedSymbol)
        SUSPENDED =
          T.let(
            :suspended,
            ArkEmail::UsageListTenantsParams::Status::TaggedSymbol
          )
        ARCHIVED =
          T.let(
            :archived,
            ArkEmail::UsageListTenantsParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::UsageListTenantsParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
