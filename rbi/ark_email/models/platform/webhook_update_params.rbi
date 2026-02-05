# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookUpdateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Platform::WebhookUpdateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        # Enable or disable the webhook
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # Events to subscribe to. Empty array means all events.
        sig do
          returns(
            T.nilable(
              T::Array[ArkEmail::Platform::WebhookUpdateParams::Event::OrSymbol]
            )
          )
        end
        attr_reader :events

        sig do
          params(
            events:
              T::Array[ArkEmail::Platform::WebhookUpdateParams::Event::OrSymbol]
          ).void
        end
        attr_writer :events

        # Display name for the webhook
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Webhook endpoint URL (must be HTTPS)
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            enabled: T::Boolean,
            events:
              T::Array[
                ArkEmail::Platform::WebhookUpdateParams::Event::OrSymbol
              ],
            name: String,
            url: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Enable or disable the webhook
          enabled: nil,
          # Events to subscribe to. Empty array means all events.
          events: nil,
          # Display name for the webhook
          name: nil,
          # Webhook endpoint URL (must be HTTPS)
          url: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              events:
                T::Array[
                  ArkEmail::Platform::WebhookUpdateParams::Event::OrSymbol
                ],
              name: String,
              url: String,
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
              T.all(Symbol, ArkEmail::Platform::WebhookUpdateParams::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Platform::WebhookUpdateParams::Event::TaggedSymbol
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
