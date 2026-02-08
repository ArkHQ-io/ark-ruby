# typed: strong

module ArkEmail
  module Models
    class UsageExportParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::UsageExportParams, ArkEmail::Internal::AnyHash)
        end

      # Export format
      sig { returns(T.nilable(ArkEmail::UsageExportParams::Format::OrSymbol)) }
      attr_reader :format_

      sig do
        params(format_: ArkEmail::UsageExportParams::Format::OrSymbol).void
      end
      attr_writer :format_

      # Only include tenants with at least this many emails sent
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_sent

      sig { params(min_sent: Integer).void }
      attr_writer :min_sent

      # Time period for export.
      #
      # **Shortcuts:** `this_month`, `last_month`, `last_30_days`, etc.
      #
      # **Month format:** `2024-01` (YYYY-MM)
      #
      # **Custom range:** `2024-01-01..2024-01-15`
      sig { returns(T.nilable(String)) }
      attr_reader :period

      sig { params(period: String).void }
      attr_writer :period

      # Filter by tenant status
      sig { returns(T.nilable(ArkEmail::UsageExportParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ArkEmail::UsageExportParams::Status::OrSymbol).void }
      attr_writer :status

      # Timezone for period calculations (IANA format)
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      sig do
        params(
          format_: ArkEmail::UsageExportParams::Format::OrSymbol,
          min_sent: Integer,
          period: String,
          status: ArkEmail::UsageExportParams::Status::OrSymbol,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Export format
        format_: nil,
        # Only include tenants with at least this many emails sent
        min_sent: nil,
        # Time period for export.
        #
        # **Shortcuts:** `this_month`, `last_month`, `last_30_days`, etc.
        #
        # **Month format:** `2024-01` (YYYY-MM)
        #
        # **Custom range:** `2024-01-01..2024-01-15`
        period: nil,
        # Filter by tenant status
        status: nil,
        # Timezone for period calculations (IANA format)
        timezone: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            format_: ArkEmail::UsageExportParams::Format::OrSymbol,
            min_sent: Integer,
            period: String,
            status: ArkEmail::UsageExportParams::Status::OrSymbol,
            timezone: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Export format
      module Format
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::UsageExportParams::Format) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CSV = T.let(:csv, ArkEmail::UsageExportParams::Format::TaggedSymbol)
        JSONL = T.let(:jsonl, ArkEmail::UsageExportParams::Format::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::UsageExportParams::Format::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::UsageExportParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ArkEmail::UsageExportParams::Status::TaggedSymbol)
        SUSPENDED =
          T.let(:suspended, ArkEmail::UsageExportParams::Status::TaggedSymbol)
        ARCHIVED =
          T.let(:archived, ArkEmail::UsageExportParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::UsageExportParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
