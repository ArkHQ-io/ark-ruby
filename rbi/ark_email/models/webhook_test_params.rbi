# typed: strong

module ArkEmail
  module Models
    class WebhookTestParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::WebhookTestParams, ArkEmail::Internal::AnyHash)
        end

      # Event type to simulate
      sig { returns(ArkEmail::WebhookTestParams::Event::OrSymbol) }
      attr_accessor :event

      sig do
        params(
          event: ArkEmail::WebhookTestParams::Event::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
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
            event: ArkEmail::WebhookTestParams::Event::OrSymbol,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Event type to simulate
      module Event
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::WebhookTestParams::Event) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_SENT =
          T.let(:MessageSent, ArkEmail::WebhookTestParams::Event::TaggedSymbol)
        MESSAGE_DELAYED =
          T.let(
            :MessageDelayed,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        MESSAGE_DELIVERY_FAILED =
          T.let(
            :MessageDeliveryFailed,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        MESSAGE_HELD =
          T.let(:MessageHeld, ArkEmail::WebhookTestParams::Event::TaggedSymbol)
        MESSAGE_BOUNCED =
          T.let(
            :MessageBounced,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        MESSAGE_LINK_CLICKED =
          T.let(
            :MessageLinkClicked,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        MESSAGE_LOADED =
          T.let(
            :MessageLoaded,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        DOMAIN_DNS_ERROR =
          T.let(
            :DomainDNSError,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        SEND_LIMIT_APPROACHING =
          T.let(
            :SendLimitApproaching,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )
        SEND_LIMIT_EXCEEDED =
          T.let(
            :SendLimitExceeded,
            ArkEmail::WebhookTestParams::Event::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::WebhookTestParams::Event::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
