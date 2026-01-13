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
