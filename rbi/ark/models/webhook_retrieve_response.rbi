# typed: strong

module Ark
  module Models
    class WebhookRetrieveResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::WebhookRetrieveResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::WebhookRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::WebhookRetrieveResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::WebhookRetrieveResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::WebhookRetrieveResponse::Data,
            meta: Ark::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::WebhookRetrieveResponse::Data,
              Ark::Internal::AnyHash
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
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
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
                Ark::Models::WebhookRetrieveResponse::Data::Event::OrSymbol
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
                  Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
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
          extend Ark::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Ark::Models::WebhookRetrieveResponse::Data::Event)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Ark::Models::WebhookRetrieveResponse::Data::Event::TaggedSymbol
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
