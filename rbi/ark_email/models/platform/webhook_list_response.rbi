# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookListResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Platform::WebhookListResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[ArkEmail::Models::Platform::WebhookListResponse::Data]
          )
        end
        attr_accessor :data

        sig { returns(ArkEmail::APIMeta) }
        attr_reader :meta

        sig { params(meta: ArkEmail::APIMeta::OrHash).void }
        attr_writer :meta

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            data:
              T::Array[
                ArkEmail::Models::Platform::WebhookListResponse::Data::OrHash
              ],
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data:
                T::Array[ArkEmail::Models::Platform::WebhookListResponse::Data],
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
                ArkEmail::Models::Platform::WebhookListResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Platform webhook ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :created_at

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
              created_at: Time,
              enabled: T::Boolean,
              events: T::Array[String],
              name: String,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Platform webhook ID
            id:,
            created_at:,
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
                created_at: Time,
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
