# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookTestParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Platform::WebhookTestParams,
              ArkEmail::Internal::AnyHash
            )
          end

        # Event type to simulate
        sig { returns(ArkEmail::Platform::WebhookTestParams::Event::OrSymbol) }
        attr_accessor :event

        sig do
          params(
            event: ArkEmail::Platform::WebhookTestParams::Event::OrSymbol,
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
              event: ArkEmail::Platform::WebhookTestParams::Event::OrSymbol,
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
            T.type_alias do
              T.all(Symbol, ArkEmail::Platform::WebhookTestParams::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Platform::WebhookTestParams::Event::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
