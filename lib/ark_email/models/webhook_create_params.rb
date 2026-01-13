# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Webhooks#create
    class WebhookCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute name
      #   Webhook name for identification
      #
      #   @return [String]
      required :name, String

      # @!attribute url
      #   HTTPS endpoint URL
      #
      #   @return [String]
      required :url, String

      # @!attribute all_events
      #   Subscribe to all events (ignores events array, accepts null)
      #
      #   @return [Boolean, nil]
      optional :all_events, ArkEmail::Internal::Type::Boolean, api_name: :allEvents, nil?: true

      # @!attribute enabled
      #   Whether the webhook is enabled (accepts null)
      #
      #   @return [Boolean, nil]
      optional :enabled, ArkEmail::Internal::Type::Boolean, nil?: true

      # @!attribute events
      #   Events to subscribe to (accepts null):
      #
      #   - `MessageSent` - Email successfully delivered to recipient's server
      #   - `MessageDelayed` - Temporary delivery failure, will retry
      #   - `MessageDeliveryFailed` - Permanent delivery failure
      #   - `MessageHeld` - Email held for manual review
      #   - `MessageBounced` - Email bounced back
      #   - `MessageLinkClicked` - Recipient clicked a tracked link
      #   - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
      #   - `DomainDNSError` - DNS configuration issue detected
      #
      #   @return [Array<Symbol, ArkEmail::Models::WebhookCreateParams::Event>, nil]
      optional :events,
               -> { ArkEmail::Internal::Type::ArrayOf[enum: ArkEmail::WebhookCreateParams::Event] },
               nil?: true

      # @!method initialize(name:, url:, all_events: nil, enabled: nil, events: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::WebhookCreateParams} for more details.
      #
      #   @param name [String] Webhook name for identification
      #
      #   @param url [String] HTTPS endpoint URL
      #
      #   @param all_events [Boolean, nil] Subscribe to all events (ignores events array, accepts null)
      #
      #   @param enabled [Boolean, nil] Whether the webhook is enabled (accepts null)
      #
      #   @param events [Array<Symbol, ArkEmail::Models::WebhookCreateParams::Event>, nil] Events to subscribe to (accepts null):
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      module Event
        extend ArkEmail::Internal::Type::Enum

        MESSAGE_SENT = :MessageSent
        MESSAGE_DELAYED = :MessageDelayed
        MESSAGE_DELIVERY_FAILED = :MessageDeliveryFailed
        MESSAGE_HELD = :MessageHeld
        MESSAGE_BOUNCED = :MessageBounced
        MESSAGE_LINK_CLICKED = :MessageLinkClicked
        MESSAGE_LOADED = :MessageLoaded
        DOMAIN_DNS_ERROR = :DomainDNSError

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
