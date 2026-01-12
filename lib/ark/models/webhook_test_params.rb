# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#test_
    class WebhookTestParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute event
      #   Event type to simulate
      #
      #   @return [Symbol, Ark::Models::WebhookTestParams::Event]
      required :event, enum: -> { Ark::WebhookTestParams::Event }

      # @!method initialize(event:, request_options: {})
      #   @param event [Symbol, Ark::Models::WebhookTestParams::Event] Event type to simulate
      #
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]

      # Event type to simulate
      module Event
        extend Ark::Internal::Type::Enum

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
