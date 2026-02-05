# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#export
    class UsageExportParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute format_
      #   Export format
      #
      #   @return [Symbol, ArkEmail::Models::UsageExportParams::Format, nil]
      optional :format_, enum: -> { ArkEmail::UsageExportParams::Format }

      # @!attribute min_sent
      #   Only include tenants with at least this many emails sent
      #
      #   @return [Integer, nil]
      optional :min_sent, Integer

      # @!attribute period
      #   Time period for export.
      #
      #   **Shortcuts:** `this_month`, `last_month`, `last_30_days`, etc.
      #
      #   **Month format:** `2024-01` (YYYY-MM)
      #
      #   **Custom range:** `2024-01-01..2024-01-15`
      #
      #   @return [String, nil]
      optional :period, String

      # @!attribute status
      #   Filter by tenant status
      #
      #   @return [Symbol, ArkEmail::Models::UsageExportParams::Status, nil]
      optional :status, enum: -> { ArkEmail::UsageExportParams::Status }

      # @!attribute timezone
      #   Timezone for period calculations (IANA format)
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(format_: nil, min_sent: nil, period: nil, status: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::UsageExportParams} for more details.
      #
      #   @param format_ [Symbol, ArkEmail::Models::UsageExportParams::Format] Export format
      #
      #   @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      #   @param period [String] Time period for export.
      #
      #   @param status [Symbol, ArkEmail::Models::UsageExportParams::Status] Filter by tenant status
      #
      #   @param timezone [String] Timezone for period calculations (IANA format)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Export format
      module Format
        extend ArkEmail::Internal::Type::Enum

        CSV = :csv
        JSONL = :jsonl

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        ACTIVE = :active
        SUSPENDED = :suspended
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
