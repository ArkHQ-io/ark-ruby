# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Webhooks#create
    class WebhookCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute events
      #   Events to subscribe to:
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
      #   @return [Array<Symbol, ArkEmail::Models::WebhookCreateParams::Event>]
      required :events, -> { ArkEmail::Internal::Type::ArrayOf[enum: ArkEmail::WebhookCreateParams::Event] }

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
      #   Subscribe to all events (ignores events array)
      #
      #   @return [Boolean, nil]
      optional :all_events, ArkEmail::Internal::Type::Boolean, api_name: :allEvents

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, ArkEmail::Internal::Type::Boolean

      # @!method initialize(events:, name:, url:, all_events: nil, enabled: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::WebhookCreateParams} for more details.
      #
      #   @param events [Array<Symbol, ArkEmail::Models::WebhookCreateParams::Event>] Events to subscribe to:
      #
      #   @param name [String] Webhook name for identification
      #
      #   @param url [String] HTTPS endpoint URL
      #
      #   @param all_events [Boolean] Subscribe to all events (ignores events array)
      #
      #   @param enabled [Boolean]
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
