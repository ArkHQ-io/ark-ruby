# frozen_string_literal: true

module Ark
  module Resources
    class Webhooks
      # Some parameter documentations has been truncated, see
      # {Ark::Models::WebhookCreateParams} for more details.
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
      # @overload create(events:, name:, url:, all_events: nil, enabled: nil, request_options: {})
      #
      # @param events [Array<Symbol, Ark::Models::WebhookCreateParams::Event>] Events to subscribe to:
      #
      # @param name [String] Webhook name for identification
      #
      # @param url [String] HTTPS endpoint URL
      #
      # @param all_events [Boolean] Subscribe to all events (ignores events array)
      #
      # @param enabled [Boolean]
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::WebhookCreateResponse]
      #
      # @see Ark::Models::WebhookCreateParams
      def create(params)
        parsed, options = Ark::WebhookCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "webhooks",
          body: parsed,
          model: Ark::Models::WebhookCreateResponse,
          options: options
        )
      end

      # Get webhook details
      #
      # @overload retrieve(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::WebhookRetrieveResponse]
      #
      # @see Ark::Models::WebhookRetrieveParams
      def retrieve(webhook_id, params = {})
        @client.request(
          method: :get,
          path: ["webhooks/%1$s", webhook_id],
          model: Ark::Models::WebhookRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update a webhook
      #
      # @overload update(webhook_id, all_events: nil, enabled: nil, events: nil, name: nil, url: nil, request_options: {})
      #
      # @param webhook_id [String]
      # @param all_events [Boolean]
      # @param enabled [Boolean]
      # @param events [Array<String>]
      # @param name [String]
      # @param url [String]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::WebhookUpdateResponse]
      #
      # @see Ark::Models::WebhookUpdateParams
      def update(webhook_id, params = {})
        parsed, options = Ark::WebhookUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["webhooks/%1$s", webhook_id],
          body: parsed,
          model: Ark::Models::WebhookUpdateResponse,
          options: options
        )
      end

      # Get all configured webhook endpoints
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::WebhookListResponse]
      #
      # @see Ark::Models::WebhookListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "webhooks",
          model: Ark::Models::WebhookListResponse,
          options: params[:request_options]
        )
      end

      # Delete a webhook
      #
      # @overload delete(webhook_id, request_options: {})
      #
      # @param webhook_id [String]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::WebhookDeleteResponse]
      #
      # @see Ark::Models::WebhookDeleteParams
      def delete(webhook_id, params = {})
        @client.request(
          method: :delete,
          path: ["webhooks/%1$s", webhook_id],
          model: Ark::Models::WebhookDeleteResponse,
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
      # @param event [Symbol, Ark::Models::WebhookTestParams::Event] Event type to simulate
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::WebhookTestResponse]
      #
      # @see Ark::Models::WebhookTestParams
      def test_(webhook_id, params)
        parsed, options = Ark::WebhookTestParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["webhooks/%1$s/test", webhook_id],
          body: parsed,
          model: Ark::Models::WebhookTestResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Ark::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
