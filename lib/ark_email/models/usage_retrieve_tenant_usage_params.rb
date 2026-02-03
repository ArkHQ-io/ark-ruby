# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#retrieve_tenant_usage
    class UsageRetrieveTenantUsageParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute period
      #   Time period for usage data. Defaults to current month.
      #
      #   **Formats:**
      #
      #   - Shortcuts: `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
      #     `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
      #   - Month: `2024-01`
      #   - Range: `2024-01-01..2024-01-31`
      #   - Day: `2024-01-15`
      #
      #   @return [String, nil]
      optional :period, String

      # @!attribute timezone
      #   Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(period: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::UsageRetrieveTenantUsageParams} for more details.
      #
      #   @param period [String] Time period for usage data. Defaults to current month.
      #
      #   @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
