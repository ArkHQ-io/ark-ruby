# typed: strong

module ArkEmail
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
          name: String,
          url: String,
          all_events: T.nilable(T::Boolean),
          enabled: T.nilable(T::Boolean),
          events:
            T.nilable(T::Array[ArkEmail::WebhookCreateParams::Event::OrSymbol]),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookCreateResponse)
      end
      def create(
        # Webhook name for identification
        name:,
        # HTTPS endpoint URL
        url:,
        # Subscribe to all events (ignores events array, accepts null)
        all_events: nil,
        # Whether the webhook is enabled (accepts null)
        enabled: nil,
        # Events to subscribe to (accepts null):
        #
        # - `MessageSent` - Email successfully delivered to recipient's server
        # - `MessageDelayed` - Temporary delivery failure, will retry
        # - `MessageDeliveryFailed` - Permanent delivery failure
        # - `MessageHeld` - Email held for manual review
        # - `MessageBounced` - Email bounced back
        # - `MessageLinkClicked` - Recipient clicked a tracked link
        # - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
        # - `DomainDNSError` - DNS configuration issue detected
        events: nil,
        request_options: {}
      )
      end

      # Get webhook details
      sig do
        params(
          webhook_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookRetrieveResponse)
      end
      def retrieve(webhook_id, request_options: {})
      end

      # Update a webhook
      sig do
        params(
          webhook_id: String,
          all_events: T.nilable(T::Boolean),
          enabled: T.nilable(T::Boolean),
          events: T.nilable(T::Array[String]),
          name: T.nilable(String),
          url: T.nilable(String),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookUpdateResponse)
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
        params(request_options: ArkEmail::RequestOptions::OrHash).returns(
          ArkEmail::Models::WebhookListResponse
        )
      end
      def list(request_options: {})
      end

      # Delete a webhook
      sig do
        params(
          webhook_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookDeleteResponse)
      end
      def delete(webhook_id, request_options: {})
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
      sig do
        params(
          webhook_id: String,
          after: Integer,
          before: Integer,
          event: ArkEmail::WebhookListDeliveriesParams::Event::OrSymbol,
          page: Integer,
          per_page: Integer,
          success: T::Boolean,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookListDeliveriesResponse)
      end
      def list_deliveries(
        # Webhook ID or UUID
        webhook_id,
        # Only deliveries after this Unix timestamp
        after: nil,
        # Only deliveries before this Unix timestamp
        before: nil,
        # Filter by event type
        event: nil,
        # Page number (default 1)
        page: nil,
        # Items per page (default 30, max 100)
        per_page: nil,
        # Filter by delivery success (true = 2xx response, false = non-2xx or error)
        success: nil,
        request_options: {}
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
      sig do
        params(
          delivery_id: String,
          webhook_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookReplayDeliveryResponse)
      end
      def replay_delivery(
        # Delivery ID (UUID) to replay
        delivery_id,
        # Webhook ID or UUID
        webhook_id:,
        request_options: {}
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
      sig do
        params(
          delivery_id: String,
          webhook_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookRetrieveDeliveryResponse)
      end
      def retrieve_delivery(
        # Delivery ID (UUID)
        delivery_id,
        # Webhook ID or UUID
        webhook_id:,
        request_options: {}
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
      sig do
        params(
          webhook_id: String,
          event: ArkEmail::WebhookTestParams::Event::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::WebhookTestResponse)
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
      sig { params(client: ArkEmail::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
