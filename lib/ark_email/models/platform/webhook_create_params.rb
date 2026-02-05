# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#create
      class WebhookCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute name
        #   Display name for the webhook
        #
        #   @return [String]
        required :name, String

        # @!attribute url
        #   Webhook endpoint URL (must be HTTPS)
        #
        #   @return [String]
        required :url, String

        # @!attribute events
        #   Events to subscribe to. Empty array means all events.
        #
        #   @return [Array<Symbol, ArkEmail::Models::Platform::WebhookCreateParams::Event>, nil]
        optional :events,
                 -> { ArkEmail::Internal::Type::ArrayOf[enum: ArkEmail::Platform::WebhookCreateParams::Event] }

        # @!method initialize(name:, url:, events: nil, request_options: {})
        #   @param name [String] Display name for the webhook
        #
        #   @param url [String] Webhook endpoint URL (must be HTTPS)
        #
        #   @param events [Array<Symbol, ArkEmail::Models::Platform::WebhookCreateParams::Event>] Events to subscribe to. Empty array means all events.
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
end
