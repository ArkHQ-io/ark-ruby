# typed: strong

module Ark
  module Resources
    class Webhooks
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
      sig do
        params(
          events: T::Array[Ark::WebhookCreateParams::Event::OrSymbol],
          name: String,
          url: String,
          all_events: T::Boolean,
          enabled: T::Boolean,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::WebhookResponse)
      end
      def create(
        # Events to subscribe to:
        #
        # - `MessageSent` - Email successfully delivered to recipient's server
        # - `MessageDelayed` - Temporary delivery failure, will retry
        # - `MessageDeliveryFailed` - Permanent delivery failure
        # - `MessageHeld` - Email held for manual review
        # - `MessageBounced` - Email bounced back
        # - `MessageLinkClicked` - Recipient clicked a tracked link
        # - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
        # - `DomainDNSError` - DNS configuration issue detected
        events:,
        # Webhook name for identification
        name:,
        # HTTPS endpoint URL
        url:,
        # Subscribe to all events (ignores events array)
        all_events: nil,
        enabled: nil,
        request_options: {}
      )
      end

      # Get webhook details
      sig do
        params(
          webhook_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::WebhookResponse)
      end
      def retrieve(webhook_id, request_options: {})
      end

      # Update a webhook
      sig do
        params(
          webhook_id: String,
          all_events: T::Boolean,
          enabled: T::Boolean,
          events: T::Array[String],
          name: String,
          url: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::WebhookResponse)
      end
      def update(
        webhook_id,
        all_events: nil,
        enabled: nil,
        events: nil,
        name: nil,
        url: nil,
        request_options: {}
      )
      end

      # Get all configured webhook endpoints
      sig do
        params(request_options: Ark::RequestOptions::OrHash).returns(
          Ark::Models::WebhookListResponse
        )
      end
      def list(request_options: {})
      end

      # Delete a webhook
      sig do
        params(
          webhook_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::SuccessResponse)
      end
      def delete(webhook_id, request_options: {})
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
      sig do
        params(
          webhook_id: String,
          event: Ark::WebhookTestParams::Event::OrSymbol,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::WebhookTestResponse)
      end
      def test_(
        # Webhook ID or UUID
        webhook_id,
        # Event type to simulate
        event:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Ark::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
