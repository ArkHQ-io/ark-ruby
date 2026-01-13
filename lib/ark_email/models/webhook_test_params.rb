# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Webhooks#test_
    class WebhookTestParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute event
      #   Event type to simulate
      #
      #   @return [Symbol, ArkEmail::Models::WebhookTestParams::Event]
      required :event, enum: -> { ArkEmail::WebhookTestParams::Event }

      # @!method initialize(event:, request_options: {})
      #   @param event [Symbol, ArkEmail::Models::WebhookTestParams::Event] Event type to simulate
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Event type to simulate
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
