# typed: strong

module Ark
  module Models
    class WebhookTestParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(Ark::WebhookTestParams, Ark::Internal::AnyHash) }

      # Event type to simulate
      sig { returns(Ark::WebhookTestParams::Event::OrSymbol) }
      attr_accessor :event

      sig do
        params(
          event: Ark::WebhookTestParams::Event::OrSymbol,
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Event type to simulate
        event:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event: Ark::WebhookTestParams::Event::OrSymbol,
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Event type to simulate
      module Event
        extend Ark::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Ark::WebhookTestParams::Event) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_SENT =
          T.let(:MessageSent, Ark::WebhookTestParams::Event::TaggedSymbol)
        MESSAGE_DELAYED =
          T.let(:MessageDelayed, Ark::WebhookTestParams::Event::TaggedSymbol)
        MESSAGE_DELIVERY_FAILED =
          T.let(
            :MessageDeliveryFailed,
            Ark::WebhookTestParams::Event::TaggedSymbol
          )
        MESSAGE_HELD =
          T.let(:MessageHeld, Ark::WebhookTestParams::Event::TaggedSymbol)
        MESSAGE_BOUNCED =
          T.let(:MessageBounced, Ark::WebhookTestParams::Event::TaggedSymbol)
        MESSAGE_LINK_CLICKED =
          T.let(
            :MessageLinkClicked,
            Ark::WebhookTestParams::Event::TaggedSymbol
          )
        MESSAGE_LOADED =
          T.let(:MessageLoaded, Ark::WebhookTestParams::Event::TaggedSymbol)
        DOMAIN_DNS_ERROR =
          T.let(:DomainDNSError, Ark::WebhookTestParams::Event::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Ark::WebhookTestParams::Event::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
