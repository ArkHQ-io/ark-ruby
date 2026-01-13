# typed: strong

module ArkEmail
  module Resources
    class Tracking
      # Create a new track domain for open/click tracking.
      #
      # After creation, you must configure a CNAME record pointing to the provided DNS
      # value before tracking will work.
      sig do
        params(
          domain_id: Integer,
          name: String,
          ssl_enabled: T.nilable(T::Boolean),
          track_clicks: T.nilable(T::Boolean),
          track_opens: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TrackingCreateResponse)
      end
      def create(
        # ID of the sending domain to attach this track domain to
        domain_id:,
        # Subdomain name (e.g., 'track' for track.yourdomain.com)
        name:,
        # Enable SSL for tracking URLs (accepts null, defaults to true)
        ssl_enabled: nil,
        # Enable click tracking (accepts null, defaults to true)
        track_clicks: nil,
        # Enable open tracking (tracking pixel, accepts null, defaults to true)
        track_opens: nil,
        request_options: {}
      )
      end

      # Get details of a specific track domain including DNS configuration
      sig do
        params(
          tracking_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TrackingRetrieveResponse)
      end
      def retrieve(
        # Track domain ID or UUID
        tracking_id,
        request_options: {}
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
      sig do
        params(
          tracking_id: String,
          excluded_click_domains: T.nilable(String),
          ssl_enabled: T.nilable(T::Boolean),
          track_clicks: T.nilable(T::Boolean),
          track_opens: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TrackingUpdateResponse)
      end
      def update(
        # Track domain ID or UUID
        tracking_id,
        # Comma-separated list of domains to exclude from click tracking (accepts null)
        excluded_click_domains: nil,
        # Enable or disable SSL for tracking URLs (accepts null)
        ssl_enabled: nil,
        # Enable or disable click tracking (accepts null)
        track_clicks: nil,
        # Enable or disable open tracking (accepts null)
        track_opens: nil,
        request_options: {}
      )
      end

      # List all track domains configured for your server. Track domains enable open and
      # click tracking for your emails.
      sig do
        params(request_options: ArkEmail::RequestOptions::OrHash).returns(
          ArkEmail::Models::TrackingListResponse
        )
      end
      def list(request_options: {})
      end

      # Delete a track domain. This will disable tracking for any emails using this
      # domain.
      sig do
        params(
          tracking_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TrackingDeleteResponse)
      end
      def delete(
        # Track domain ID or UUID
        tracking_id,
        request_options: {}
      )
      end

      # Check DNS configuration for the track domain.
      #
      # The track domain requires a CNAME record to be configured before open and click
      # tracking will work. Use this endpoint to verify the DNS is correctly set up.
      sig do
        params(
          tracking_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TrackingVerifyResponse)
      end
      def verify(
        # Track domain ID or UUID
        tracking_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ArkEmail::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
