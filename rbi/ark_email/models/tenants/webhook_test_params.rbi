# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookTestParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::WebhookTestParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        # Event type to simulate
        sig { returns(ArkEmail::Tenants::WebhookTestParams::Event::OrSymbol) }
        attr_accessor :event

        sig do
          params(
            tenant_id: String,
            event: ArkEmail::Tenants::WebhookTestParams::Event::OrSymbol,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          # Event type to simulate
          event:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              event: ArkEmail::Tenants::WebhookTestParams::Event::OrSymbol,
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
              T.all(Symbol, ArkEmail::Tenants::WebhookTestParams::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Tenants::WebhookTestParams::Event::TaggedSymbol
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
