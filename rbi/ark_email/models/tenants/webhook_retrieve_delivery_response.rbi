# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookRetrieveDeliveryResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        # Full details of a webhook delivery including request and response
        sig do
          returns(
            ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data
          )
        end
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::OrHash
          ).void
        end
        attr_writer :data

        sig { returns(ArkEmail::APIMeta) }
        attr_reader :meta

        sig { params(meta: ArkEmail::APIMeta::OrHash).void }
        attr_writer :meta

        sig { returns(T::Boolean) }
        attr_accessor :success

        # Detailed information about a webhook delivery attempt
        sig do
          params(
            data:
              ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Full details of a webhook delivery including request and response
          data:,
          meta:,
          success: true
        )
        end

        sig do
          override.returns(
            {
              data:
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data,
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
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Unique delivery ID (UUID)
          sig { returns(String) }
          attr_accessor :id

          # Attempt number for this delivery
          sig { returns(Integer) }
          attr_accessor :attempt

          # Event type that triggered this delivery
          sig do
            returns(
              ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
            )
          end
          attr_accessor :event

          # The request that was sent to your endpoint
          sig do
            returns(
              ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request
            )
          end
          attr_reader :request

          sig do
            params(
              request:
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request::OrHash
            ).void
          end
          attr_writer :request

          # The response received from your endpoint
          sig do
            returns(
              ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response
            )
          end
          attr_reader :response

          sig do
            params(
              response:
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response::OrHash
            ).void
          end
          attr_writer :response

          # HTTP status code returned by the endpoint
          sig { returns(T.nilable(Integer)) }
          attr_accessor :status_code

          # Whether the delivery was successful (2xx response)
          sig { returns(T::Boolean) }
          attr_accessor :success

          # When this delivery attempt occurred
          sig { returns(Time) }
          attr_accessor :timestamp

          # URL the webhook was delivered to
          sig { returns(String) }
          attr_accessor :url

          # ID of the webhook this delivery belongs to
          sig { returns(String) }
          attr_accessor :webhook_id

          # Name of the webhook for easy identification
          sig { returns(String) }
          attr_accessor :webhook_name

          # Whether this delivery will be retried
          sig { returns(T::Boolean) }
          attr_accessor :will_retry

          # Full details of a webhook delivery including request and response
          sig do
            params(
              id: String,
              attempt: Integer,
              event:
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::OrSymbol,
              request:
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request::OrHash,
              response:
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response::OrHash,
              status_code: T.nilable(Integer),
              success: T::Boolean,
              timestamp: Time,
              url: String,
              webhook_id: String,
              webhook_name: String,
              will_retry: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique delivery ID (UUID)
            id:,
            # Attempt number for this delivery
            attempt:,
            # Event type that triggered this delivery
            event:,
            # The request that was sent to your endpoint
            request:,
            # The response received from your endpoint
            response:,
            # HTTP status code returned by the endpoint
            status_code:,
            # Whether the delivery was successful (2xx response)
            success:,
            # When this delivery attempt occurred
            timestamp:,
            # URL the webhook was delivered to
            url:,
            # ID of the webhook this delivery belongs to
            webhook_id:,
            # Name of the webhook for easy identification
            webhook_name:,
            # Whether this delivery will be retried
            will_retry:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                attempt: Integer,
                event:
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol,
                request:
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request,
                response:
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response,
                status_code: T.nilable(Integer),
                success: T::Boolean,
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

          # Event type that triggered this delivery
          module Event
            extend ArkEmail::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MESSAGE_SENT =
              T.let(
                :MessageSent,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_DELAYED =
              T.let(
                :MessageDelayed,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_DELIVERY_FAILED =
              T.let(
                :MessageDeliveryFailed,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_HELD =
              T.let(
                :MessageHeld,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_BOUNCED =
              T.let(
                :MessageBounced,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_LINK_CLICKED =
              T.let(
                :MessageLinkClicked,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            MESSAGE_LOADED =
              T.let(
                :MessageLoaded,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )
            DOMAIN_DNS_ERROR =
              T.let(
                :DomainDNSError,
                ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Request < ArkEmail::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request,
                  ArkEmail::Internal::AnyHash
                )
              end

            # HTTP headers that were sent with the request
            sig { returns(T::Hash[Symbol, String]) }
            attr_accessor :headers

            # The complete webhook payload that was sent
            sig { returns(T::Hash[Symbol, T.anything]) }
            attr_accessor :payload

            # The request that was sent to your endpoint
            sig do
              params(
                headers: T::Hash[Symbol, String],
                payload: T::Hash[Symbol, T.anything]
              ).returns(T.attached_class)
            end
            def self.new(
              # HTTP headers that were sent with the request
              headers:,
              # The complete webhook payload that was sent
              payload:
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
                  ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response,
                  ArkEmail::Internal::AnyHash
                )
              end

            # HTTP status code from your endpoint
            sig { returns(T.nilable(Integer)) }
            attr_accessor :status_code

            # Response body from your endpoint (may be truncated)
            sig { returns(T.nilable(String)) }
            attr_accessor :body

            # The response received from your endpoint
            sig do
              params(
                status_code: T.nilable(Integer),
                body: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # HTTP status code from your endpoint
              status_code:,
              # Response body from your endpoint (may be truncated)
              body: nil
            )
            end

            sig do
              override.returns(
                { status_code: T.nilable(Integer), body: T.nilable(String) }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
