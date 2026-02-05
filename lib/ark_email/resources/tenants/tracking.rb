# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      class Tracking
        # Create a new track domain for open/click tracking for a tenant.
        #
        # After creation, you must configure a CNAME record pointing to the provided DNS
        # value before tracking will work.
        #
        # @overload create(tenant_id, domain_id:, name:, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
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
        # @return [ArkEmail::Models::Tenants::TrackingCreateResponse]
        #
        # @see ArkEmail::Models::Tenants::TrackingCreateParams
        def create(tenant_id, params)
          parsed, options = ArkEmail::Tenants::TrackingCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["tenants/%1$s/tracking", tenant_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::TrackingCreateResponse,
            options: options
          )
        end

        # Get details of a specific track domain including DNS configuration.
        #
        # @overload retrieve(tracking_id, tenant_id:, request_options: {})
        #
        # @param tracking_id [String] Track domain ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::TrackingRetrieveResponse]
        #
        # @see ArkEmail::Models::Tenants::TrackingRetrieveParams
        def retrieve(tracking_id, params)
          parsed, options = ArkEmail::Tenants::TrackingRetrieveParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/tracking/%2$s", tenant_id, tracking_id],
            model: ArkEmail::Models::Tenants::TrackingRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {ArkEmail::Models::Tenants::TrackingUpdateParams} for more details.
        #
        # Update track domain settings.
        #
        # Use this to:
        #
        # - Enable/disable click tracking
        # - Enable/disable open tracking
        # - Enable/disable SSL
        # - Set excluded click domains
        #
        # @overload update(tracking_id, tenant_id:, excluded_click_domains: nil, ssl_enabled: nil, track_clicks: nil, track_opens: nil, request_options: {})
        #
        # @param tracking_id [String] Path param: Track domain ID
        #
        # @param tenant_id [String] Path param: The tenant ID
        #
        # @param excluded_click_domains [String, nil] Body param: Comma-separated list of domains to exclude from click tracking (acce
        #
        # @param ssl_enabled [Boolean, nil] Body param: Enable or disable SSL for tracking URLs (accepts null)
        #
        # @param track_clicks [Boolean, nil] Body param: Enable or disable click tracking (accepts null)
        #
        # @param track_opens [Boolean, nil] Body param: Enable or disable open tracking (accepts null)
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::TrackingUpdateResponse]
        #
        # @see ArkEmail::Models::Tenants::TrackingUpdateParams
        def update(tracking_id, params)
          parsed, options = ArkEmail::Tenants::TrackingUpdateParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["tenants/%1$s/tracking/%2$s", tenant_id, tracking_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::TrackingUpdateResponse,
            options: options
          )
        end

        # List all track domains configured for a tenant. Track domains enable open and
        # click tracking for emails.
        #
        # @overload list(tenant_id, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::TrackingListResponse]
        #
        # @see ArkEmail::Models::Tenants::TrackingListParams
        def list(tenant_id, params = {})
          @client.request(
            method: :get,
            path: ["tenants/%1$s/tracking", tenant_id],
            model: ArkEmail::Models::Tenants::TrackingListResponse,
            options: params[:request_options]
          )
        end

        # Delete a track domain. This will disable tracking for any emails using this
        # domain.
        #
        # @overload delete(tracking_id, tenant_id:, request_options: {})
        #
        # @param tracking_id [String] Track domain ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::TrackingDeleteResponse]
        #
        # @see ArkEmail::Models::Tenants::TrackingDeleteParams
        def delete(tracking_id, params)
          parsed, options = ArkEmail::Tenants::TrackingDeleteParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["tenants/%1$s/tracking/%2$s", tenant_id, tracking_id],
            model: ArkEmail::Models::Tenants::TrackingDeleteResponse,
            options: options
          )
        end

        # Check DNS configuration for the track domain.
        #
        # The track domain requires a CNAME record to be configured before open and click
        # tracking will work. Use this endpoint to verify the DNS is correctly set up.
        #
        # @overload verify(tracking_id, tenant_id:, request_options: {})
        #
        # @param tracking_id [String] Track domain ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::TrackingVerifyResponse]
        #
        # @see ArkEmail::Models::Tenants::TrackingVerifyParams
        def verify(tracking_id, params)
          parsed, options = ArkEmail::Tenants::TrackingVerifyParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["tenants/%1$s/tracking/%2$s/verify", tenant_id, tracking_id],
            model: ArkEmail::Models::Tenants::TrackingVerifyResponse,
            options: options
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
end
