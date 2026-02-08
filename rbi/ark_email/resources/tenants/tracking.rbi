# typed: strong

module ArkEmail
  module Resources
    class Tenants
      class Tracking
        # Create a new track domain for open/click tracking for a tenant.
        #
        # After creation, you must configure a CNAME record pointing to the provided DNS
        # value before tracking will work.
        sig do
          params(
            tenant_id: String,
            domain_id: Integer,
            name: String,
            ssl_enabled: T.nilable(T::Boolean),
            track_clicks: T.nilable(T::Boolean),
            track_opens: T.nilable(T::Boolean),
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::TrackingCreateResponse)
        end
        def create(
          # The tenant ID
          tenant_id,
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

        # Get details of a specific track domain including DNS configuration.
        sig do
          params(
            tracking_id: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::TrackingRetrieveResponse)
        end
        def retrieve(
          # Track domain ID
          tracking_id,
          # The tenant ID
          tenant_id:,
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
            tenant_id: String,
            excluded_click_domains: T.nilable(String),
            ssl_enabled: T.nilable(T::Boolean),
            track_clicks: T.nilable(T::Boolean),
            track_opens: T.nilable(T::Boolean),
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::TrackingUpdateResponse)
        end
        def update(
          # Path param: Track domain ID
          tracking_id,
          # Path param: The tenant ID
          tenant_id:,
          # Body param: Comma-separated list of domains to exclude from click tracking
          # (accepts null)
          excluded_click_domains: nil,
          # Body param: Enable or disable SSL for tracking URLs (accepts null)
          ssl_enabled: nil,
          # Body param: Enable or disable click tracking (accepts null)
          track_clicks: nil,
          # Body param: Enable or disable open tracking (accepts null)
          track_opens: nil,
          request_options: {}
        )
        end

        # List all track domains configured for a tenant. Track domains enable open and
        # click tracking for emails.
        sig do
          params(
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::TrackingListResponse)
        end
        def list(
          # The tenant ID
          tenant_id,
          request_options: {}
        )
        end

        # Delete a track domain. This will disable tracking for any emails using this
        # domain.
        sig do
          params(
            tracking_id: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::TrackingDeleteResponse)
        end
        def delete(
          # Track domain ID
          tracking_id,
          # The tenant ID
          tenant_id:,
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
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::TrackingVerifyResponse)
        end
        def verify(
          # Track domain ID
          tracking_id,
          # The tenant ID
          tenant_id:,
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
end
