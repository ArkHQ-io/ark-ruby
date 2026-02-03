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
      #   Time period for export. Defaults to current month.
      #
      #   @return [String, nil]
      optional :period, String

      # @!attribute status
      #   Filter by tenant status
      #
      #   @return [Symbol, ArkEmail::Models::UsageExportParams::Status, nil]
      optional :status, enum: -> { ArkEmail::UsageExportParams::Status }

      # @!attribute timezone
      #   Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(format_: nil, min_sent: nil, period: nil, status: nil, timezone: nil, request_options: {})
      #   @param format_ [Symbol, ArkEmail::Models::UsageExportParams::Format] Export format
      #
      #   @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      #   @param period [String] Time period for export. Defaults to current month.
      #
      #   @param status [Symbol, ArkEmail::Models::UsageExportParams::Status] Filter by tenant status
      #
      #   @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Export format
      module Format
        extend ArkEmail::Internal::Type::Enum

        CSV = :csv
        JSONL = :jsonl
        JSON = :json

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
