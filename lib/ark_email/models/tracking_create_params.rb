# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tracking#create
    class TrackingCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute domain_id
      #   ID of the sending domain to attach this track domain to
      #
      #   @return [String]
      required :domain_id, String, api_name: :domainId

      # @!attribute name
      #   Subdomain name (e.g., 'track' for track.yourdomain.com)
      #
      #   @return [String]
      required :name, String

      # @!attribute ssl_enabled
      #   Enable SSL for tracking URLs (recommended)
      #
      #   @return [Boolean, nil]
      optional :ssl_enabled, ArkEmail::Internal::Type::Boolean, api_name: :sslEnabled

      # @!attribute track_clicks
      #   Enable click tracking
      #
      #   @return [Boolean, nil]
      optional :track_clicks, ArkEmail::Internal::Type::Boolean, api_name: :trackClicks

      # @!attribute track_opens
      #   Enable open tracking (tracking pixel)
      #
      #   @return [Boolean, nil]
      optional :track_opens, ArkEmail::Internal::Type::Boolean, api_name: :trackOpens

      # @!method initialize(domain_id:, name:, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
      #   @param domain_id [String] ID of the sending domain to attach this track domain to
      #
      #   @param name [String] Subdomain name (e.g., 'track' for track.yourdomain.com)
      #
      #   @param ssl_enabled [Boolean] Enable SSL for tracking URLs (recommended)
      #
      #   @param track_clicks [Boolean] Enable click tracking
      #
      #   @param track_opens [Boolean] Enable open tracking (tracking pixel)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
