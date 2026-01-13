# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tracking
      # Create a new track domain for open/click tracking.
      #
      # After creation, you must configure a CNAME record pointing to the provided DNS
      # value before tracking will work.
      #
      # @overload create(domain_id:, name:, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
      #
      # @param domain_id [Integer] ID of the sending domain to attach this track domain to
      #
      # @param name [String] Subdomain name (e.g., 'track' for track.yourdomain.com)
      #
      # @param ssl_enabled [Boolean, nil] Enable SSL for tracking URLs (accepts null, defaults to true)
      #
      # @param track_clicks [Boolean, nil] Enable click tracking (accepts null, defaults to true)
      #
      # @param track_opens [Boolean, nil] Enable open tracking (tracking pixel, accepts null, defaults to true)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TrackingCreateResponse]
      #
      # @see ArkEmail::Models::TrackingCreateParams
      def create(params)
        parsed, options = ArkEmail::TrackingCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "tracking",
          body: parsed,
          model: ArkEmail::Models::TrackingCreateResponse,
          options: options
        )
      end

      # Get details of a specific track domain including DNS configuration
      #
      # @overload retrieve(tracking_id, request_options: {})
      #
      # @param tracking_id [String] Track domain ID or UUID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TrackingRetrieveResponse]
      #
      # @see ArkEmail::Models::TrackingRetrieveParams
      def retrieve(tracking_id, params = {})
        @client.request(
          method: :get,
          path: ["tracking/%1$s", tracking_id],
          model: ArkEmail::Models::TrackingRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update track domain settings.
      #
      # Use this to:
      #
      # - Enable/disable click tracking
      # - Enable/disable open tracking
      # - Enable/disable SSL
      # - Set excluded click domains
      #
      # @overload update(tracking_id, excluded_click_domains: nil, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
      #
      # @param tracking_id [String] Track domain ID or UUID
      #
      # @param excluded_click_domains [String, nil] Comma-separated list of domains to exclude from click tracking (accepts null)
      #
      # @param ssl_enabled [Boolean, nil] Enable or disable SSL for tracking URLs (accepts null)
      #
      # @param track_clicks [Boolean, nil] Enable or disable click tracking (accepts null)
      #
      # @param track_opens [Boolean, nil] Enable or disable open tracking (accepts null)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TrackingUpdateResponse]
      #
      # @see ArkEmail::Models::TrackingUpdateParams
      def update(tracking_id, params = {})
        parsed, options = ArkEmail::TrackingUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["tracking/%1$s", tracking_id],
          body: parsed,
          model: ArkEmail::Models::TrackingUpdateResponse,
          options: options
        )
      end

      # List all track domains configured for your server. Track domains enable open and
      # click tracking for your emails.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TrackingListResponse]
      #
      # @see ArkEmail::Models::TrackingListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "tracking",
          model: ArkEmail::Models::TrackingListResponse,
          options: params[:request_options]
        )
      end

      # Delete a track domain. This will disable tracking for any emails using this
      # domain.
      #
      # @overload delete(tracking_id, request_options: {})
      #
      # @param tracking_id [String] Track domain ID or UUID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TrackingDeleteResponse]
      #
      # @see ArkEmail::Models::TrackingDeleteParams
      def delete(tracking_id, params = {})
        @client.request(
          method: :delete,
          path: ["tracking/%1$s", tracking_id],
          model: ArkEmail::Models::TrackingDeleteResponse,
          options: params[:request_options]
        )
      end

      # Check DNS configuration for the track domain.
      #
      # The track domain requires a CNAME record to be configured before open and click
      # tracking will work. Use this endpoint to verify the DNS is correctly set up.
      #
      # @overload verify(tracking_id, request_options: {})
      #
      # @param tracking_id [String] Track domain ID or UUID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TrackingVerifyResponse]
      #
      # @see ArkEmail::Models::TrackingVerifyParams
      def verify(tracking_id, params = {})
        @client.request(
          method: :post,
          path: ["tracking/%1$s/verify", tracking_id],
          model: ArkEmail::Models::TrackingVerifyResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ArkEmail::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
