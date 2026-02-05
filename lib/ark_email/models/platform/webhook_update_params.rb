# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#update
      class WebhookUpdateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute enabled
        #   Enable or disable the webhook
        #
        #   @return [Boolean, nil]
        optional :enabled, ArkEmail::Internal::Type::Boolean

        # @!attribute events
        #   Events to subscribe to. Empty array means all events.
        #
        #   @return [Array<Symbol, ArkEmail::Models::Platform::WebhookUpdateParams::Event>, nil]
        optional :events,
                 -> { ArkEmail::Internal::Type::ArrayOf[enum: ArkEmail::Platform::WebhookUpdateParams::Event] }

        # @!attribute name
        #   Display name for the webhook
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute url
        #   Webhook endpoint URL (must be HTTPS)
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(enabled: nil, events: nil, name: nil, url: nil, request_options: {})
        #   @param enabled [Boolean] Enable or disable the webhook
        #
        #   @param events [Array<Symbol, ArkEmail::Models::Platform::WebhookUpdateParams::Event>] Events to subscribe to. Empty array means all events.
        #
        #   @param name [String] Display name for the webhook
        #
        #   @param url [String] Webhook endpoint URL (must be HTTPS)
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
