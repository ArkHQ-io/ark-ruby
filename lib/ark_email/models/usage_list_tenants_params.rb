# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#list_tenants
    class UsageListTenantsParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute min_sent
      #   Only include tenants with at least this many emails sent
      #
      #   @return [Integer, nil]
      optional :min_sent, Integer

      # @!attribute page
      #   Page number (1-indexed)
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute period
      #   Time period for usage data. Defaults to current month.
      #
      #   **Shortcuts:** `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
      #   `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
      #
      #   **Month format:** `2024-01` (YYYY-MM)
      #
      #   **Custom range:** `2024-01-01..2024-01-15`
      #
      #   @return [String, nil]
      optional :period, String

      # @!attribute per_page
      #   Results per page (max 100)
      #
      #   @return [Integer, nil]
      optional :per_page, Integer

      # @!attribute sort
      #   Sort order for results. Prefix with `-` for descending order.
      #
      #   @return [Symbol, ArkEmail::Models::UsageListTenantsParams::Sort, nil]
      optional :sort, enum: -> { ArkEmail::UsageListTenantsParams::Sort }

      # @!attribute status
      #   Filter by tenant status
      #
      #   @return [Symbol, ArkEmail::Models::UsageListTenantsParams::Status, nil]
      optional :status, enum: -> { ArkEmail::UsageListTenantsParams::Status }

      # @!attribute timezone
      #   Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(min_sent: nil, page: nil, period: nil, per_page: nil, sort: nil, status: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::UsageListTenantsParams} for more details.
      #
      #   @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param period [String] Time period for usage data. Defaults to current month.
      #
      #   @param per_page [Integer] Results per page (max 100)
      #
      #   @param sort [Symbol, ArkEmail::Models::UsageListTenantsParams::Sort] Sort order for results. Prefix with `-` for descending order.
      #
      #   @param status [Symbol, ArkEmail::Models::UsageListTenantsParams::Status] Filter by tenant status
      #
      #   @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Sort order for results. Prefix with `-` for descending order.
      module Sort
        extend ArkEmail::Internal::Type::Enum

        SENT = :sent
        MINUS_SENT = :"-sent"
        DELIVERED = :delivered
        MINUS_DELIVERED = :"-delivered"
        BOUNCE_RATE = :bounce_rate
        MINUS_BOUNCE_RATE = :"-bounce_rate"
        DELIVERY_RATE = :delivery_rate
        MINUS_DELIVERY_RATE = :"-delivery_rate"
        TENANT_NAME = :tenant_name
        MINUS_TENANT_NAME = :"-tenant_name"

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
