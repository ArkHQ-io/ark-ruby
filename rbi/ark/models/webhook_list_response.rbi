# typed: strong

module Ark
  module Models
    class WebhookListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::WebhookListResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::WebhookListResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::WebhookListResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::WebhookListResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::WebhookListResponse::Data,
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
              Ark::Models::WebhookListResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[Ark::Models::WebhookListResponse::Data::Webhook])
        end
        attr_accessor :webhooks

        sig do
          params(
            webhooks:
              T::Array[Ark::Models::WebhookListResponse::Data::Webhook::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(webhooks:)
        end

        sig do
          override.returns(
            {
              webhooks:
                T::Array[Ark::Models::WebhookListResponse::Data::Webhook]
            }
          )
        end
        def to_hash
        end

        class Webhook < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::WebhookListResponse::Data::Webhook,
                Ark::Internal::AnyHash
              )
            end

          # Webhook ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :enabled

          sig { returns(T::Array[String]) }
          attr_accessor :events

          sig { returns(String) }
          attr_accessor :name

          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              id: String,
              enabled: T::Boolean,
              events: T::Array[String],
              name: String,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Webhook ID
            id:,
            enabled:,
            events:,
            name:,
            url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                enabled: T::Boolean,
                events: T::Array[String],
                name: String,
                url: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
