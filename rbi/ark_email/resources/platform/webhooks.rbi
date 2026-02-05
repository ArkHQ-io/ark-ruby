# typed: strong

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
        sig do
          params(
            name: String,
            url: String,
            events:
              T::Array[
                ArkEmail::Platform::WebhookCreateParams::Event::OrSymbol
              ],
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookCreateResponse)
        end
        def create(
          # Display name for the webhook
          name:,
          # Webhook endpoint URL (must be HTTPS)
          url:,
          # Events to subscribe to. Empty array means all events.
          events: nil,
          request_options: {}
        )
        end

        # Get detailed information about a specific platform webhook.
        sig do
          params(
            webhook_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookRetrieveResponse)
        end
        def retrieve(
          # Platform webhook ID
          webhook_id,
          request_options: {}
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
        sig do
          params(
            webhook_id: String,
            enabled: T::Boolean,
            events:
              T::Array[
                ArkEmail::Platform::WebhookUpdateParams::Event::OrSymbol
              ],
            name: String,
            url: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookUpdateResponse)
        end
        def update(
          # Platform webhook ID
          webhook_id,
          # Enable or disable the webhook
          enabled: nil,
          # Events to subscribe to. Empty array means all events.
          events: nil,
          # Display name for the webhook
          name: nil,
          # Webhook endpoint URL (must be HTTPS)
          url: nil,
          request_options: {}
        )
        end

        # Get all platform webhook endpoints configured for your organization.
        #
        # Platform webhooks receive events from **all tenants** in your organization,
        # unlike tenant webhooks which only receive events for a specific tenant. This is
        # useful for centralized event processing and monitoring.
        sig do
          params(request_options: ArkEmail::RequestOptions::OrHash).returns(
            ArkEmail::Models::Platform::WebhookListResponse
          )
        end
        def list(request_options: {})
        end

        # Delete a platform webhook. This stops all event delivery to the webhook URL.
        # This action cannot be undone.
        sig do
          params(
            webhook_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookDeleteResponse)
        end
        def delete(
          # Platform webhook ID
          webhook_id,
          request_options: {}
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
        sig do
          params(
            after: Integer,
            before: Integer,
            event:
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::OrSymbol,
            page: Integer,
            per_page: Integer,
            success: T::Boolean,
            tenant_id: String,
            webhook_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(
            ArkEmail::Internal::PageNumberPagination[
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse
            ]
          )
        end
        def list_deliveries(
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
          # Filter by delivery success
          success: nil,
          # Filter by tenant ID
          tenant_id: nil,
          # Filter by platform webhook ID
          webhook_id: nil,
          request_options: {}
        )
        end

        # Replay a previous platform webhook delivery.
        #
        # This re-sends the original payload with a new timestamp and delivery ID. Useful
        # for recovering from temporary endpoint failures.
        sig do
          params(
            delivery_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookReplayDeliveryResponse)
        end
        def replay_delivery(
          # Delivery ID to replay
          delivery_id,
          request_options: {}
        )
        end

        # Get detailed information about a specific platform webhook delivery.
        #
        # Returns the complete request payload, headers, response, and timing info.
        sig do
          params(
            delivery_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse)
        end
        def retrieve_delivery(
          # Delivery ID (UUID)
          delivery_id,
          request_options: {}
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
        sig do
          params(
            webhook_id: String,
            event: ArkEmail::Platform::WebhookTestParams::Event::OrSymbol,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Platform::WebhookTestResponse)
        end
        def test_(
          # Platform webhook ID
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
end
