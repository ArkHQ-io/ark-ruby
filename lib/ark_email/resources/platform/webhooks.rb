# frozen_string_literal: true

module ArkEmail
  module Resources
    class Platform
      class Webhooks
        # Create a platform webhook to receive email event notifications from all tenants.
        #
        # Platform webhooks receive events from **all tenants** in your organization. Each
        # webhook payload includes a `tenant_id` field to identify which tenant the event
        # belongs to.
        #
        # **Available events:**
        #
        # - `MessageSent` - Email accepted by recipient server
        # - `MessageDeliveryFailed` - Delivery permanently failed
        # - `MessageDelayed` - Delivery temporarily failed, will retry
        # - `MessageBounced` - Email bounced
        # - `MessageHeld` - Email held for review
        # - `MessageLinkClicked` - Recipient clicked a link
        # - `MessageLoaded` - Recipient opened the email
        # - `DomainDNSError` - Domain DNS issue detected
        #
        # **Webhook payload includes:**
        #
        # - `event` - The event type
        # - `tenant_id` - The tenant that sent the email
        # - `timestamp` - Unix timestamp of the event
        # - `payload` - Event-specific data (message details, status, etc.)
        #
        # @overload create(name:, url:, events: nil, request_options: {})
        #
        # @param name [String] Display name for the webhook
        #
        # @param url [String] Webhook endpoint URL (must be HTTPS)
        #
        # @param events [Array<Symbol, ArkEmail::Models::Platform::WebhookCreateParams::Event>] Events to subscribe to. Empty array means all events.
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookCreateResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookCreateParams
        def create(params)
          parsed, options = ArkEmail::Platform::WebhookCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "platform/webhooks",
            body: parsed,
            model: ArkEmail::Models::Platform::WebhookCreateResponse,
            options: options
          )
        end

        # Get detailed information about a specific platform webhook.
        #
        # @overload retrieve(webhook_id, request_options: {})
        #
        # @param webhook_id [String] Platform webhook ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookRetrieveResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookRetrieveParams
        def retrieve(webhook_id, params = {})
          @client.request(
            method: :get,
            path: ["platform/webhooks/%1$s", webhook_id],
            model: ArkEmail::Models::Platform::WebhookRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Update a platform webhook's configuration.
        #
        # You can update:
        #
        # - `name` - Display name for the webhook
        # - `url` - The endpoint URL (must be HTTPS)
        # - `events` - Array of event types to receive (empty array = all events)
        # - `enabled` - Enable or disable the webhook
        #
        # @overload update(webhook_id, enabled: nil, events: nil, name: nil, url: nil, request_options: {})
        #
        # @param webhook_id [String] Platform webhook ID
        #
        # @param enabled [Boolean] Enable or disable the webhook
        #
        # @param events [Array<Symbol, ArkEmail::Models::Platform::WebhookUpdateParams::Event>] Events to subscribe to. Empty array means all events.
        #
        # @param name [String] Display name for the webhook
        #
        # @param url [String] Webhook endpoint URL (must be HTTPS)
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookUpdateResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookUpdateParams
        def update(webhook_id, params = {})
          parsed, options = ArkEmail::Platform::WebhookUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["platform/webhooks/%1$s", webhook_id],
            body: parsed,
            model: ArkEmail::Models::Platform::WebhookUpdateResponse,
            options: options
          )
        end

        # Get all platform webhook endpoints configured for your organization.
        #
        # Platform webhooks receive events from **all tenants** in your organization,
        # unlike tenant webhooks which only receive events for a specific tenant. This is
        # useful for centralized event processing and monitoring.
        #
        # @overload list(request_options: {})
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookListResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookListParams
        def list(params = {})
          @client.request(
            method: :get,
            path: "platform/webhooks",
            model: ArkEmail::Models::Platform::WebhookListResponse,
            options: params[:request_options]
          )
        end

        # Delete a platform webhook. This stops all event delivery to the webhook URL.
        # This action cannot be undone.
        #
        # @overload delete(webhook_id, request_options: {})
        #
        # @param webhook_id [String] Platform webhook ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookDeleteResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookDeleteParams
        def delete(webhook_id, params = {})
          @client.request(
            method: :delete,
            path: ["platform/webhooks/%1$s", webhook_id],
            model: ArkEmail::Models::Platform::WebhookDeleteResponse,
            options: params[:request_options]
          )
        end

        # Get a paginated list of platform webhook delivery attempts.
        #
        # Filter by:
        #
        # - `webhookId` - Specific webhook
        # - `tenantId` - Specific tenant
        # - `event` - Specific event type
        # - `success` - Successful (2xx) or failed deliveries
        # - `before`/`after` - Time range (Unix timestamps)
        #
        # Deliveries are returned in reverse chronological order.
        #
        # @overload list_deliveries(after: nil, before: nil, event: nil, page: nil, per_page: nil, success: nil, tenant_id: nil, webhook_id: nil, request_options: {})
        #
        # @param after [Integer] Only deliveries after this Unix timestamp
        #
        # @param before [Integer] Only deliveries before this Unix timestamp
        #
        # @param event [Symbol, ArkEmail::Models::Platform::WebhookListDeliveriesParams::Event] Filter by event type
        #
        # @param page [Integer] Page number (default 1)
        #
        # @param per_page [Integer] Items per page (default 30, max 100)
        #
        # @param success [Boolean] Filter by delivery success
        #
        # @param tenant_id [String] Filter by tenant ID
        #
        # @param webhook_id [String] Filter by platform webhook ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::Platform::WebhookListDeliveriesResponse>]
        #
        # @see ArkEmail::Models::Platform::WebhookListDeliveriesParams
        def list_deliveries(params = {})
          parsed, options = ArkEmail::Platform::WebhookListDeliveriesParams.dump_request(params)
          @client.request(
            method: :get,
            path: "platform/webhooks/deliveries",
            query: parsed.transform_keys(per_page: "perPage", tenant_id: "tenantId", webhook_id: "webhookId"),
            page: ArkEmail::Internal::PageNumberPagination,
            model: ArkEmail::Models::Platform::WebhookListDeliveriesResponse,
            options: options
          )
        end

        # Replay a previous platform webhook delivery.
        #
        # This re-sends the original payload with a new timestamp and delivery ID. Useful
        # for recovering from temporary endpoint failures.
        #
        # @overload replay_delivery(delivery_id, request_options: {})
        #
        # @param delivery_id [String] Delivery ID to replay
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookReplayDeliveryResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookReplayDeliveryParams
        def replay_delivery(delivery_id, params = {})
          @client.request(
            method: :post,
            path: ["platform/webhooks/deliveries/%1$s/replay", delivery_id],
            model: ArkEmail::Models::Platform::WebhookReplayDeliveryResponse,
            options: params[:request_options]
          )
        end

        # Get detailed information about a specific platform webhook delivery.
        #
        # Returns the complete request payload, headers, response, and timing info.
        #
        # @overload retrieve_delivery(delivery_id, request_options: {})
        #
        # @param delivery_id [String] Delivery ID (UUID)
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookRetrieveDeliveryParams
        def retrieve_delivery(delivery_id, params = {})
          @client.request(
            method: :get,
            path: ["platform/webhooks/deliveries/%1$s", delivery_id],
            model: ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse,
            options: params[:request_options]
          )
        end

        # Send a test payload to your platform webhook endpoint.
        #
        # Use this to:
        #
        # - Verify your webhook URL is accessible
        # - Test your payload handling code
        # - Ensure your server responds correctly
        #
        # The test payload is marked with `_test: true` so you can distinguish test events
        # from real events.
        #
        # @overload test_(webhook_id, event:, request_options: {})
        #
        # @param webhook_id [String] Platform webhook ID
        #
        # @param event [Symbol, ArkEmail::Models::Platform::WebhookTestParams::Event] Event type to simulate
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Platform::WebhookTestResponse]
        #
        # @see ArkEmail::Models::Platform::WebhookTestParams
        def test_(webhook_id, params)
          parsed, options = ArkEmail::Platform::WebhookTestParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["platform/webhooks/%1$s/test", webhook_id],
            body: parsed,
            model: ArkEmail::Models::Platform::WebhookTestResponse,
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
