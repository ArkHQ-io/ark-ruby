# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tracking#update
    class TrackingUpdateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute excluded_click_domains
      #   Comma-separated list of domains to exclude from click tracking
      #
      #   @return [String, nil]
      optional :excluded_click_domains, String, api_name: :excludedClickDomains

      # @!attribute ssl_enabled
      #   Enable or disable SSL for tracking URLs
      #
      #   @return [Boolean, nil]
      optional :ssl_enabled, ArkEmail::Internal::Type::Boolean, api_name: :sslEnabled

      # @!attribute track_clicks
      #   Enable or disable click tracking
      #
      #   @return [Boolean, nil]
      optional :track_clicks, ArkEmail::Internal::Type::Boolean, api_name: :trackClicks

      # @!attribute track_opens
      #   Enable or disable open tracking
      #
      #   @return [Boolean, nil]
      optional :track_opens, ArkEmail::Internal::Type::Boolean, api_name: :trackOpens

      # @!method initialize(excluded_click_domains: nil, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
      #   @param excluded_click_domains [String] Comma-separated list of domains to exclude from click tracking
      #
      #   @param ssl_enabled [Boolean] Enable or disable SSL for tracking URLs
      #
      #   @param track_clicks [Boolean] Enable or disable click tracking
      #
      #   @param track_opens [Boolean] Enable or disable open tracking
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
