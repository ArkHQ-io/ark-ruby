# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookCreateResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Platform::WebhookCreateResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Models::Platform::WebhookCreateResponse::Data) }
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Platform::WebhookCreateResponse::Data::OrHash
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
              ArkEmail::Models::Platform::WebhookCreateResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Platform::WebhookCreateResponse::Data,
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
                ArkEmail::Models::Platform::WebhookCreateResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Platform webhook ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :created_at

          # Whether the webhook is active
          sig { returns(T::Boolean) }
          attr_accessor :enabled

          # Subscribed events (empty = all events)
          sig do
            returns(
              T::Array[
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              ]
            )
          end
          attr_accessor :events

          # Webhook name for identification
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Time) }
          attr_accessor :updated_at

          # Webhook endpoint URL
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              id: String,
              created_at: Time,
              enabled: T::Boolean,
              events:
                T::Array[
                  ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::OrSymbol
                ],
              name: String,
              updated_at: Time,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Platform webhook ID
            id:,
            created_at:,
            # Whether the webhook is active
            enabled:,
            # Subscribed events (empty = all events)
            events:,
            # Webhook name for identification
            name:,
            updated_at:,
            # Webhook endpoint URL
            url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                enabled: T::Boolean,
                events:
                  T::Array[
                    ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
                  ],
                name: String,
                updated_at: Time,
                url: String
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
                  ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MESSAGE_SENT =
              T.let(
                :MessageSent,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_DELAYED =
              T.let(
                :MessageDelayed,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_DELIVERY_FAILED =
              T.let(
                :MessageDeliveryFailed,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_HELD =
              T.let(
                :MessageHeld,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_BOUNCED =
              T.let(
                :MessageBounced,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_LINK_CLICKED =
              T.let(
                :MessageLinkClicked,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_LOADED =
              T.let(
                :MessageLoaded,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )
            DOMAIN_DNS_ERROR =
              T.let(
                :DomainDNSError,
                ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event::TaggedSymbol
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
