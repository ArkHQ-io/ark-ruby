# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Platform::WebhookCreateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        # Display name for the webhook
        sig { returns(String) }
        attr_accessor :name

        # Webhook endpoint URL (must be HTTPS)
        sig { returns(String) }
        attr_accessor :url

        # Events to subscribe to. Empty array means all events.
        sig do
          returns(
            T.nilable(
              T::Array[ArkEmail::Platform::WebhookCreateParams::Event::OrSymbol]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[ArkEmail::Platform::WebhookCreateParams::Event::OrSymbol]
          ).void
        end
        attr_writer :events

        sig do
          params(
            name: String,
            url: String,
            events:
              T::Array[
                ArkEmail::Platform::WebhookCreateParams::Event::OrSymbol
              ],
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Display name for the webhook
          name:,
          # Webhook endpoint URL (must be HTTPS)
          url:,
          # Events to subscribe to. Empty array means all events.
          events: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              url: String,
              events:
                T::Array[
                  ArkEmail::Platform::WebhookCreateParams::Event::OrSymbol
                ],
              request_options: ArkEmail::RequestOptions
            }
          )
        end
        def to_hash
        end

        module Event
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ArkEmail::Platform::WebhookCreateParams::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Platform::WebhookCreateParams::Event::TaggedSymbol
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
