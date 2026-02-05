# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#retrieve
    class UsageRetrieveParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute period
      #   Time period for usage data.
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

      # @!attribute timezone
      #   Timezone for period calculations (IANA format)
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(period: nil, timezone: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::UsageRetrieveParams} for more details.
      #
      #   @param period [String] Time period for usage data.
      #
      #   @param timezone [String] Timezone for period calculations (IANA format)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
