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
      #   @return [Integer]
      required :domain_id, Integer, api_name: :domainId

      # @!attribute name
      #   Subdomain name (e.g., 'track' for track.yourdomain.com)
      #
      #   @return [String]
      required :name, String

      # @!attribute ssl_enabled
      #   Enable SSL for tracking URLs (accepts null, defaults to true)
      #
      #   @return [Boolean, nil]
      optional :ssl_enabled, ArkEmail::Internal::Type::Boolean, api_name: :sslEnabled, nil?: true

      # @!attribute track_clicks
      #   Enable click tracking (accepts null, defaults to true)
      #
      #   @return [Boolean, nil]
      optional :track_clicks, ArkEmail::Internal::Type::Boolean, api_name: :trackClicks, nil?: true

      # @!attribute track_opens
      #   Enable open tracking (tracking pixel, accepts null, defaults to true)
      #
      #   @return [Boolean, nil]
      optional :track_opens, ArkEmail::Internal::Type::Boolean, api_name: :trackOpens, nil?: true

      # @!method initialize(domain_id:, name:, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
      #   @param domain_id [Integer] ID of the sending domain to attach this track domain to
      #
      #   @param name [String] Subdomain name (e.g., 'track' for track.yourdomain.com)
      #
      #   @param ssl_enabled [Boolean, nil] Enable SSL for tracking URLs (accepts null, defaults to true)
      #
      #   @param track_clicks [Boolean, nil] Enable click tracking (accepts null, defaults to true)
      #
      #   @param track_opens [Boolean, nil] Enable open tracking (tracking pixel, accepts null, defaults to true)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
