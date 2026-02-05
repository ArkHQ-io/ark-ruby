# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookTestResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Platform::WebhookTestResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Models::Platform::WebhookTestResponse::Data) }
        attr_reader :data

        sig do
          params(
            data: ArkEmail::Models::Platform::WebhookTestResponse::Data::OrHash
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
            data: ArkEmail::Models::Platform::WebhookTestResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Platform::WebhookTestResponse::Data,
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
                ArkEmail::Models::Platform::WebhookTestResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Request duration in milliseconds
          sig { returns(Integer) }
          attr_accessor :duration_ms

          # HTTP status code from the webhook endpoint
          sig { returns(Integer) }
          attr_accessor :status_code

          # Whether the webhook endpoint responded with a 2xx status
          sig { returns(T::Boolean) }
          attr_accessor :success

          # Error message if the request failed
          sig { returns(T.nilable(String)) }
          attr_accessor :error

          sig do
            params(
              duration_ms: Integer,
              status_code: Integer,
              success: T::Boolean,
              error: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Request duration in milliseconds
            duration_ms:,
            # HTTP status code from the webhook endpoint
            status_code:,
            # Whether the webhook endpoint responded with a 2xx status
            success:,
            # Error message if the request failed
            error: nil
          )
          end

          sig do
            override.returns(
              {
                duration_ms: Integer,
                status_code: Integer,
                success: T::Boolean,
                error: T.nilable(String)
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
