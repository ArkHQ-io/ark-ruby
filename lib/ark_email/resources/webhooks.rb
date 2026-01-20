# frozen_string_literal: true

module ArkEmail
  module Resources
    class Webhooks
      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::WebhookCreateParams} for more details.
      #
      # Create a webhook endpoint to receive email event notifications.
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
      # @overload create(name:, url:, all_events: nil, enabled: nil, events: nil, request_options: {})
      #
      # @param name [String] Webhook name for identification
      #
      # @param url [String] HTTPS endpoint URL
      #
      # @param all_events [Boolean, nil] Subscribe to all events (ignores events array, accepts null)
      #
      # @param enabled [Boolean, nil] Whether the webhook is enabled (accepts null)
      #
      # @param events [Array<Symbol, ArkEmail::Models::WebhookCreateParams::Event>, nil] Events to subscribe to (accepts null):
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookCreateResponse]
      #
      # @see ArkEmail::Models::WebhookCreateParams
      def create(params)
        parsed, options = ArkEmail::WebhookCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "webhooks",
          body: parsed,
          model: ArkEmail::Models::WebhookCreateResponse,
          options: options
        )
      end

      # Get webhook details
      #
      # @overload retrieve(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookRetrieveResponse]
      #
      # @see ArkEmail::Models::WebhookRetrieveParams
      def retrieve(webhook_id, params = {})
        @client.request(
          method: :get,
          path: ["webhooks/%1$s", webhook_id],
          model: ArkEmail::Models::WebhookRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update a webhook
      #
      # @overload update(webhook_id, all_events: nil, enabled: nil, events: nil, name: nil, url: nil, request_options: {})
      #
      # @param webhook_id [String]
      # @param all_events [Boolean, nil]
      # @param enabled [Boolean, nil]
      # @param events [Array<String>, nil]
      # @param name [String, nil]
      # @param url [String, nil]
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookUpdateResponse]
      #
      # @see ArkEmail::Models::WebhookUpdateParams
      def update(webhook_id, params = {})
        parsed, options = ArkEmail::WebhookUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["webhooks/%1$s", webhook_id],
          body: parsed,
          model: ArkEmail::Models::WebhookUpdateResponse,
          options: options
        )
      end

      # Get all configured webhook endpoints
      #
      # @overload list(request_options: {})
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookListResponse]
      #
      # @see ArkEmail::Models::WebhookListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "webhooks",
          model: ArkEmail::Models::WebhookListResponse,
          options: params[:request_options]
        )
      end

      # Delete a webhook
      #
      # @overload delete(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookDeleteResponse]
      #
      # @see ArkEmail::Models::WebhookDeleteParams
      def delete(webhook_id, params = {})
        @client.request(
          method: :delete,
          path: ["webhooks/%1$s", webhook_id],
          model: ArkEmail::Models::WebhookDeleteResponse,
          options: params[:request_options]
        )
      end

      # Get a paginated list of delivery attempts for a specific webhook.
      #
      # Use this to:
      #
      # - Monitor webhook health and delivery success rate
      # - Debug failed deliveries
      # - Find specific events to replay
      #
      # **Filtering:**
      #
      # - Filter by success/failure to find problematic deliveries
      # - Filter by event type to find specific events
      # - Filter by time range for debugging recent issues
      #
      # **Retry behavior:** Failed deliveries are automatically retried with exponential
      # backoff over ~3 days. Check `willRetry` to see if more attempts are scheduled.
      #
      # @overload list_deliveries(webhook_id, after: nil, before: nil, event: nil, page: nil, per_page: nil, success: nil, request_options: {})
      #
      # @param webhook_id [String] Webhook ID or UUID
      #
      # @param after [Integer] Only deliveries after this Unix timestamp
      #
      # @param before [Integer] Only deliveries before this Unix timestamp
      #
      # @param event [Symbol, ArkEmail::Models::WebhookListDeliveriesParams::Event] Filter by event type
      #
      # @param page [Integer] Page number (default 1)
      #
      # @param per_page [Integer] Items per page (default 30, max 100)
      #
      # @param success [Boolean] Filter by delivery success (true = 2xx response, false = non-2xx or error)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookListDeliveriesResponse]
      #
      # @see ArkEmail::Models::WebhookListDeliveriesParams
      def list_deliveries(webhook_id, params = {})
        parsed, options = ArkEmail::WebhookListDeliveriesParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["webhooks/%1$s/deliveries", webhook_id],
          query: parsed.transform_keys(per_page: "perPage"),
          model: ArkEmail::Models::WebhookListDeliveriesResponse,
          options: options
        )
      end

      # Re-send a webhook delivery to your endpoint.
      #
      # **Use cases:**
      #
      # - Recover from transient failures after fixing your endpoint
      # - Test endpoint changes with real historical data
      # - Retry deliveries that failed due to downtime
      #
      # **How it works:**
      #
      # 1. Fetches the original payload from the delivery
      # 2. Generates a new timestamp and signature
      # 3. Sends to your webhook URL immediately
      # 4. Returns the result (does not queue for retry if it fails)
      #
      # **Note:** The webhook must be enabled to replay deliveries.
      #
      # @overload replay_delivery(delivery_id, webhook_id:, request_options: {})
      #
      # @param delivery_id [String] Delivery ID (UUID) to replay
      #
      # @param webhook_id [String] Webhook ID or UUID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookReplayDeliveryResponse]
      #
      # @see ArkEmail::Models::WebhookReplayDeliveryParams
      def replay_delivery(delivery_id, params)
        parsed, options = ArkEmail::WebhookReplayDeliveryParams.dump_request(params)
        webhook_id =
          parsed.delete(:webhook_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :post,
          path: ["webhooks/%1$s/deliveries/%2$s/replay", webhook_id, delivery_id],
          model: ArkEmail::Models::WebhookReplayDeliveryResponse,
          options: options
        )
      end

      # Get detailed information about a specific webhook delivery attempt.
      #
      # Returns:
      #
      # - The complete request payload that was sent
      # - Request headers including the signature
      # - Response status code and body from your endpoint
      # - Timing information
      #
      # Use this to debug why a delivery failed or verify what data was sent.
      #
      # @overload retrieve_delivery(delivery_id, webhook_id:, request_options: {})
      #
      # @param delivery_id [String] Delivery ID (UUID)
      #
      # @param webhook_id [String] Webhook ID or UUID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookRetrieveDeliveryResponse]
      #
      # @see ArkEmail::Models::WebhookRetrieveDeliveryParams
      def retrieve_delivery(delivery_id, params)
        parsed, options = ArkEmail::WebhookRetrieveDeliveryParams.dump_request(params)
        webhook_id =
          parsed.delete(:webhook_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["webhooks/%1$s/deliveries/%2$s", webhook_id, delivery_id],
          model: ArkEmail::Models::WebhookRetrieveDeliveryResponse,
          options: options
        )
      end

      # Send a test payload to your webhook endpoint and verify it receives the data
      # correctly.
      #
      # Use this to:
      #
      # - Verify your webhook URL is accessible
      # - Test your signature verification code
      # - Ensure your server handles the payload format correctly
      #
      # **Test payload format:** The test payload is identical to real webhook payloads,
      # containing sample data for the specified event type. Your webhook should respond
      # with a 2xx status code.
      #
      # @overload test_(webhook_id, event:, request_options: {})
      #
      # @param webhook_id [String] Webhook ID or UUID
      #
      # @param event [Symbol, ArkEmail::Models::WebhookTestParams::Event] Event type to simulate
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::WebhookTestResponse]
      #
      # @see ArkEmail::Models::WebhookTestParams
      def test_(webhook_id, params)
        parsed, options = ArkEmail::WebhookTestParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["webhooks/%1$s/test", webhook_id],
          body: parsed,
          model: ArkEmail::Models::WebhookTestResponse,
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
