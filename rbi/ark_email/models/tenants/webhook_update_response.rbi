# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookUpdateResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::WebhookUpdateResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Models::Tenants::WebhookUpdateResponse::Data) }
        attr_reader :data

        sig do
          params(
            data: ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::OrHash
          ).void
        end
        attr_writer :data

        sig { returns(ArkEmail::APIMeta) }
        attr_reader :meta

        sig { params(meta: ArkEmail::APIMeta::OrHash).void }
        attr_writer :meta

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            data:
              ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::WebhookUpdateResponse::Data,
              meta: ArkEmail::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end

        class Data < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Webhook ID
          sig { returns(String) }
          attr_accessor :id

          # Whether subscribed to all events
          sig { returns(T::Boolean) }
          attr_accessor :all_events

          sig { returns(Time) }
          attr_accessor :created_at

          # Whether the webhook is active
          sig { returns(T::Boolean) }
          attr_accessor :enabled

          # Subscribed events
          sig do
            returns(
              T::Array[
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              ]
            )
          end
          attr_accessor :events

          # Webhook name for identification
          sig { returns(String) }
          attr_accessor :name

          # Webhook endpoint URL
          sig { returns(String) }
          attr_accessor :url

          sig { returns(String) }
          attr_accessor :uuid

          sig do
            params(
              id: String,
              all_events: T::Boolean,
              created_at: Time,
              enabled: T::Boolean,
              events:
                T::Array[
                  ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::OrSymbol
                ],
              name: String,
              url: String,
              uuid: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Webhook ID
            id:,
            # Whether subscribed to all events
            all_events:,
            created_at:,
            # Whether the webhook is active
            enabled:,
            # Subscribed events
            events:,
            # Webhook name for identification
            name:,
            # Webhook endpoint URL
            url:,
            uuid:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                all_events: T::Boolean,
                created_at: Time,
                enabled: T::Boolean,
                events:
                  T::Array[
                    ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
                  ],
                name: String,
                url: String,
                uuid: String
              }
            )
          end
          def to_hash
          end

          module Event
            extend ArkEmail::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MESSAGE_SENT =
              T.let(
                :MessageSent,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_DELAYED =
              T.let(
                :MessageDelayed,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_DELIVERY_FAILED =
              T.let(
                :MessageDeliveryFailed,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_HELD =
              T.let(
                :MessageHeld,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_BOUNCED =
              T.let(
                :MessageBounced,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_LINK_CLICKED =
              T.let(
                :MessageLinkClicked,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_LOADED =
              T.let(
                :MessageLoaded,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )
            DOMAIN_DNS_ERROR =
              T.let(
                :DomainDNSError,
                ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::Tenants::WebhookUpdateResponse::Data::Event::TaggedSymbol
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
end
