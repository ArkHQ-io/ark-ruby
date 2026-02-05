# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::WebhookCreateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        # Webhook name for identification
        sig { returns(String) }
        attr_accessor :name

        # HTTPS endpoint URL
        sig { returns(String) }
        attr_accessor :url

        # Subscribe to all events (ignores events array, accepts null)
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :all_events

        # Whether the webhook is enabled (accepts null)
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

        # Events to subscribe to (accepts null):
        #
        # - `MessageSent` - Email successfully delivered to recipient's server
        # - `MessageDelayed` - Temporary delivery failure, will retry
        # - `MessageDeliveryFailed` - Permanent delivery failure
        # - `MessageHeld` - Email held for manual review
        # - `MessageBounced` - Email bounced back
        # - `MessageLinkClicked` - Recipient clicked a tracked link
        # - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
        # - `DomainDNSError` - DNS configuration issue detected
        sig do
          returns(
            T.nilable(
              T::Array[ArkEmail::Tenants::WebhookCreateParams::Event::OrSymbol]
            )
          )
        end
        attr_accessor :events

        sig do
          params(
            name: String,
            url: String,
            all_events: T.nilable(T::Boolean),
            enabled: T.nilable(T::Boolean),
            events:
              T.nilable(
                T::Array[
                  ArkEmail::Tenants::WebhookCreateParams::Event::OrSymbol
                ]
              ),
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Webhook name for identification
          name:,
          # HTTPS endpoint URL
          url:,
          # Subscribe to all events (ignores events array, accepts null)
          all_events: nil,
          # Whether the webhook is enabled (accepts null)
          enabled: nil,
          # Events to subscribe to (accepts null):
          #
          # - `MessageSent` - Email successfully delivered to recipient's server
          # - `MessageDelayed` - Temporary delivery failure, will retry
          # - `MessageDeliveryFailed` - Permanent delivery failure
          # - `MessageHeld` - Email held for manual review
          # - `MessageBounced` - Email bounced back
          # - `MessageLinkClicked` - Recipient clicked a tracked link
          # - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
          # - `DomainDNSError` - DNS configuration issue detected
          events: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              url: String,
              all_events: T.nilable(T::Boolean),
              enabled: T.nilable(T::Boolean),
              events:
                T.nilable(
                  T::Array[
                    ArkEmail::Tenants::WebhookCreateParams::Event::OrSymbol
                  ]
                ),
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
              T.all(Symbol, ArkEmail::Tenants::WebhookCreateParams::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Tenants::WebhookCreateParams::Event::TaggedSymbol
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
