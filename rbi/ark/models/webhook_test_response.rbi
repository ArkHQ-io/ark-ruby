# typed: strong

module Ark
  module Models
    class WebhookTestResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::WebhookTestResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::WebhookTestResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::WebhookTestResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::WebhookTestResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::WebhookTestResponse::Data,
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
              Ark::Models::WebhookTestResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Request duration in milliseconds
        sig { returns(Integer) }
        attr_accessor :duration

        # Event type that was tested
        sig { returns(String) }
        attr_accessor :event

        # HTTP status code from the webhook endpoint
        sig { returns(T.nilable(Integer)) }
        attr_accessor :status_code

        # Whether the webhook endpoint responded with a 2xx status
        sig { returns(T::Boolean) }
        attr_accessor :success

        # Response body from the webhook endpoint (truncated if too long)
        sig { returns(T.nilable(String)) }
        attr_accessor :body

        # Error message if the request failed
        sig { returns(T.nilable(String)) }
        attr_accessor :error

        sig do
          params(
            duration: Integer,
            event: String,
            status_code: T.nilable(Integer),
            success: T::Boolean,
            body: T.nilable(String),
            error: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Request duration in milliseconds
          duration:,
          # Event type that was tested
          event:,
          # HTTP status code from the webhook endpoint
          status_code:,
          # Whether the webhook endpoint responded with a 2xx status
          success:,
          # Response body from the webhook endpoint (truncated if too long)
          body: nil,
          # Error message if the request failed
          error: nil
        )
        end

        sig do
          override.returns(
            {
              duration: Integer,
              event: String,
              status_code: T.nilable(Integer),
              success: T::Boolean,
              body: T.nilable(String),
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
