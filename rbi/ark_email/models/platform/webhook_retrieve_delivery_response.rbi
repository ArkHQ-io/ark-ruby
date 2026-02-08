# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookRetrieveDeliveryResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(
            ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data
          )
        end
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::OrHash
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
              ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::OrHash,
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
                ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data,
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
                ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Unique delivery ID
          sig { returns(String) }
          attr_accessor :id

          # Attempt number
          sig { returns(Integer) }
          attr_accessor :attempt

          # Event type
          sig { returns(String) }
          attr_accessor :event

          # Request details
          sig do
            returns(
              ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request
            )
          end
          attr_reader :request

          sig do
            params(
              request:
                ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request::OrHash
            ).void
          end
          attr_writer :request

          # Response details
          sig do
            returns(
              ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response
            )
          end
          attr_reader :response

          sig do
            params(
              response:
                ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response::OrHash
            ).void
          end
          attr_writer :response

          # HTTP status code from your endpoint
          sig { returns(T.nilable(Integer)) }
          attr_accessor :status_code

          # Whether delivery was successful
          sig { returns(T::Boolean) }
          attr_accessor :success

          # Tenant that triggered the event
          sig { returns(String) }
          attr_accessor :tenant_id

          # When delivery was attempted
          sig { returns(Time) }
          attr_accessor :timestamp

          # Endpoint URL
          sig { returns(String) }
          attr_accessor :url

          # Platform webhook ID
          sig { returns(String) }
          attr_accessor :webhook_id

          # Platform webhook name
          sig { returns(String) }
          attr_accessor :webhook_name

          # Whether this will be retried
          sig { returns(T::Boolean) }
          attr_accessor :will_retry

          sig do
            params(
              id: String,
              attempt: Integer,
              event: String,
              request:
                ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request::OrHash,
              response:
                ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response::OrHash,
              status_code: T.nilable(Integer),
              success: T::Boolean,
              tenant_id: String,
              timestamp: Time,
              url: String,
              webhook_id: String,
              webhook_name: String,
              will_retry: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique delivery ID
            id:,
            # Attempt number
            attempt:,
            # Event type
            event:,
            # Request details
            request:,
            # Response details
            response:,
            # HTTP status code from your endpoint
            status_code:,
            # Whether delivery was successful
            success:,
            # Tenant that triggered the event
            tenant_id:,
            # When delivery was attempted
            timestamp:,
            # Endpoint URL
            url:,
            # Platform webhook ID
            webhook_id:,
            # Platform webhook name
            webhook_name:,
            # Whether this will be retried
            will_retry:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                attempt: Integer,
                event: String,
                request:
                  ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request,
                response:
                  ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response,
                status_code: T.nilable(Integer),
                success: T::Boolean,
                tenant_id: String,
                timestamp: Time,
                url: String,
                webhook_id: String,
                webhook_name: String,
                will_retry: T::Boolean
              }
            )
          end
          def to_hash
          end

          class Request < ArkEmail::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request,
                  ArkEmail::Internal::AnyHash
                )
              end

            # Request headers including signature
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_reader :headers

            sig { params(headers: T::Hash[Symbol, String]).void }
            attr_writer :headers

            # The complete webhook payload that was sent
            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_reader :payload

            sig { params(payload: T::Hash[Symbol, T.anything]).void }
            attr_writer :payload

            # Request details
            sig do
              params(
                headers: T::Hash[Symbol, String],
                payload: T::Hash[Symbol, T.anything]
              ).returns(T.attached_class)
            end
            def self.new(
              # Request headers including signature
              headers: nil,
              # The complete webhook payload that was sent
              payload: nil
            )
            end

            sig do
              override.returns(
                {
                  headers: T::Hash[Symbol, String],
                  payload: T::Hash[Symbol, T.anything]
                }
              )
            end
            def to_hash
            end
          end

          class Response < ArkEmail::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response,
                  ArkEmail::Internal::AnyHash
                )
              end

            # Response body (truncated if too large)
            sig { returns(T.nilable(String)) }
            attr_accessor :body

            # Response time in milliseconds
            sig { returns(T.nilable(Integer)) }
            attr_reader :duration

            sig { params(duration: Integer).void }
            attr_writer :duration

            # Response details
            sig do
              params(body: T.nilable(String), duration: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # Response body (truncated if too large)
              body: nil,
              # Response time in milliseconds
              duration: nil
            )
            end

            sig do
              override.returns({ body: T.nilable(String), duration: Integer })
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
