# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#list_by_tenant
    class UsageListByTenantParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute limit
      #   Maximum number of tenants to return (1-100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute min_sent
      #   Only include tenants with at least this many emails sent
      #
      #   @return [Integer, nil]
      optional :min_sent, Integer

      # @!attribute offset
      #   Number of tenants to skip for pagination
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!attribute period
      #   Time period for usage data. Defaults to current month.
      #
      #   @return [String, nil]
      optional :period, String

      # @!attribute sort
      #   Sort order for results. Prefix with `-` for descending order.
      #
      #   @return [Symbol, ArkEmail::Models::UsageListByTenantParams::Sort, nil]
      optional :sort, enum: -> { ArkEmail::UsageListByTenantParams::Sort }

      # @!attribute status
      #   Filter by tenant status
      #
      #   @return [Symbol, ArkEmail::Models::UsageListByTenantParams::Status, nil]
      optional :status, enum: -> { ArkEmail::UsageListByTenantParams::Status }

      # @!attribute timezone
      #   Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(limit: nil, min_sent: nil, offset: nil, period: nil, sort: nil, status: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::UsageListByTenantParams} for more details.
      #
      #   @param limit [Integer] Maximum number of tenants to return (1-100)
      #
      #   @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      #   @param offset [Integer] Number of tenants to skip for pagination
      #
      #   @param period [String] Time period for usage data. Defaults to current month.
      #
      #   @param sort [Symbol, ArkEmail::Models::UsageListByTenantParams::Sort] Sort order for results. Prefix with `-` for descending order.
      #
      #   @param status [Symbol, ArkEmail::Models::UsageListByTenantParams::Status] Filter by tenant status
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
        NAME = :name
        MINUS_NAME = :"-name"

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
