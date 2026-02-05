# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      class Webhooks
        # Some parameter documentations has been truncated, see
        # {ArkEmail::Models::Tenants::WebhookCreateParams} for more details.
        #
        # Create a webhook endpoint to receive email event notifications for a tenant.
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
        # @overload create(tenant_id, name:, url:, all_events: nil, enabled: nil, events: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param name [String] Webhook name for identification
        #
        # @param url [String] HTTPS endpoint URL
        #
        # @param all_events [Boolean, nil] Subscribe to all events (ignores events array, accepts null)
        #
        # @param enabled [Boolean, nil] Whether the webhook is enabled (accepts null)
        #
        # @param events [Array<Symbol, ArkEmail::Models::Tenants::WebhookCreateParams::Event>, nil] Events to subscribe to (accepts null):
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookCreateResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookCreateParams
        def create(tenant_id, params)
          parsed, options = ArkEmail::Tenants::WebhookCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["tenants/%1$s/webhooks", tenant_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::WebhookCreateResponse,
            options: options
          )
        end

        # Get webhook details
        #
        # @overload retrieve(webhook_id, tenant_id:, request_options: {})
        #
        # @param webhook_id [String] Webhook ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookRetrieveResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookRetrieveParams
        def retrieve(webhook_id, params)
          parsed, options = ArkEmail::Tenants::WebhookRetrieveParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/webhooks/%2$s", tenant_id, webhook_id],
            model: ArkEmail::Models::Tenants::WebhookRetrieveResponse,
            options: options
          )
        end

        # Update a webhook
        #
        # @overload update(webhook_id, tenant_id:, all_events: nil, enabled: nil, events: nil, name: nil, url: nil, request_options: {})
        #
        # @param webhook_id [String] Path param: Webhook ID
        #
        # @param tenant_id [String] Path param: The tenant ID
        #
        # @param all_events [Boolean, nil] Body param
        #
        # @param enabled [Boolean, nil] Body param
        #
        # @param events [Array<String>, nil] Body param
        #
        # @param name [String, nil] Body param
        #
        # @param url [String, nil] Body param
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookUpdateResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookUpdateParams
        def update(webhook_id, params)
          parsed, options = ArkEmail::Tenants::WebhookUpdateParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["tenants/%1$s/webhooks/%2$s", tenant_id, webhook_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::WebhookUpdateResponse,
            options: options
          )
        end

        # Get all configured webhook endpoints for a tenant.
        #
        # @overload list(tenant_id, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookListResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookListParams
        def list(tenant_id, params = {})
          @client.request(
            method: :get,
            path: ["tenants/%1$s/webhooks", tenant_id],
            model: ArkEmail::Models::Tenants::WebhookListResponse,
            options: params[:request_options]
          )
        end

        # Delete a webhook
        #
        # @overload delete(webhook_id, tenant_id:, request_options: {})
        #
        # @param webhook_id [String] Webhook ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookDeleteResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookDeleteParams
        def delete(webhook_id, params)
          parsed, options = ArkEmail::Tenants::WebhookDeleteParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["tenants/%1$s/webhooks/%2$s", tenant_id, webhook_id],
            model: ArkEmail::Models::Tenants::WebhookDeleteResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {ArkEmail::Models::Tenants::WebhookListDeliveriesParams} for more details.
        #
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
        # @overload list_deliveries(webhook_id, tenant_id:, after: nil, before: nil, event: nil, page: nil, per_page: nil, success: nil, request_options: {})
        #
        # @param webhook_id [String] Path param: Webhook ID
        #
        # @param tenant_id [String] Path param: The tenant ID
        #
        # @param after [Integer] Query param: Only deliveries after this Unix timestamp
        #
        # @param before [Integer] Query param: Only deliveries before this Unix timestamp
        #
        # @param event [Symbol, ArkEmail::Models::Tenants::WebhookListDeliveriesParams::Event] Query param: Filter by event type
        #
        # @param page [Integer] Query param: Page number (default 1)
        #
        # @param per_page [Integer] Query param: Items per page (default 30, max 100)
        #
        # @param success [Boolean] Query param: Filter by delivery success (true = 2xx response, false = non-2xx or
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookListDeliveriesResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookListDeliveriesParams
        def list_deliveries(webhook_id, params)
          parsed, options = ArkEmail::Tenants::WebhookListDeliveriesParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/webhooks/%2$s/deliveries", tenant_id, webhook_id],
            query: parsed.transform_keys(per_page: "perPage"),
            model: ArkEmail::Models::Tenants::WebhookListDeliveriesResponse,
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
        # @overload replay_delivery(delivery_id, tenant_id:, webhook_id:, request_options: {})
        #
        # @param delivery_id [String] Delivery ID (UUID) to replay
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param webhook_id [String] Webhook ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookReplayDeliveryParams
        def replay_delivery(delivery_id, params)
          parsed, options = ArkEmail::Tenants::WebhookReplayDeliveryParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          webhook_id =
            parsed.delete(:webhook_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["tenants/%1$s/webhooks/%2$s/deliveries/%3$s/replay", tenant_id, webhook_id, delivery_id],
            model: ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse,
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
        # @overload retrieve_delivery(delivery_id, tenant_id:, webhook_id:, request_options: {})
        #
        # @param delivery_id [String] Delivery ID (UUID)
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param webhook_id [String] Webhook ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookRetrieveDeliveryParams
        def retrieve_delivery(delivery_id, params)
          parsed, options = ArkEmail::Tenants::WebhookRetrieveDeliveryParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          webhook_id =
            parsed.delete(:webhook_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/webhooks/%2$s/deliveries/%3$s", tenant_id, webhook_id, delivery_id],
            model: ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse,
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
        # @overload test_(webhook_id, tenant_id:, event:, request_options: {})
        #
        # @param webhook_id [String] Path param: Webhook ID
        #
        # @param tenant_id [String] Path param: The tenant ID
        #
        # @param event [Symbol, ArkEmail::Models::Tenants::WebhookTestParams::Event] Body param: Event type to simulate
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::WebhookTestResponse]
        #
        # @see ArkEmail::Models::Tenants::WebhookTestParams
        def test_(webhook_id, params)
          parsed, options = ArkEmail::Tenants::WebhookTestParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["tenants/%1$s/webhooks/%2$s/test", tenant_id, webhook_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::WebhookTestResponse,
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
