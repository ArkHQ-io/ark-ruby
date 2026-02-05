# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Tracking#update
      class TrackingUpdateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute excluded_click_domains
        #   Comma-separated list of domains to exclude from click tracking (accepts null)
        #
        #   @return [String, nil]
        optional :excluded_click_domains, String, api_name: :excludedClickDomains, nil?: true

        # @!attribute ssl_enabled
        #   Enable or disable SSL for tracking URLs (accepts null)
        #
        #   @return [Boolean, nil]
        optional :ssl_enabled, ArkEmail::Internal::Type::Boolean, api_name: :sslEnabled, nil?: true

        # @!attribute track_clicks
        #   Enable or disable click tracking (accepts null)
        #
        #   @return [Boolean, nil]
        optional :track_clicks, ArkEmail::Internal::Type::Boolean, api_name: :trackClicks, nil?: true

        # @!attribute track_opens
        #   Enable or disable open tracking (accepts null)
        #
        #   @return [Boolean, nil]
        optional :track_opens, ArkEmail::Internal::Type::Boolean, api_name: :trackOpens, nil?: true

        # @!method initialize(tenant_id:, excluded_click_domains: nil, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
        #   @param tenant_id [String]
        #
        #   @param excluded_click_domains [String, nil] Comma-separated list of domains to exclude from click tracking (accepts null)
        #
        #   @param ssl_enabled [Boolean, nil] Enable or disable SSL for tracking URLs (accepts null)
        #
        #   @param track_clicks [Boolean, nil] Enable or disable click tracking (accepts null)
        #
        #   @param track_opens [Boolean, nil] Enable or disable open tracking (accepts null)
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
