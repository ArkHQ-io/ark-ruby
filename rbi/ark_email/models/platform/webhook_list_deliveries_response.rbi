# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookListDeliveriesResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        # Unique delivery ID
        sig { returns(String) }
        attr_accessor :id

        # Attempt number (1 for first attempt, higher for retries)
        sig { returns(Integer) }
        attr_accessor :attempt

        # Event type
        sig do
          returns(
            ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
          )
        end
        attr_accessor :event

        # HTTP status code returned by your endpoint (null if connection failed)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :status_code

        # Whether delivery was successful (2xx response)
        sig { returns(T::Boolean) }
        attr_accessor :success

        # Tenant that triggered the event
        sig { returns(String) }
        attr_accessor :tenant_id

        # When the delivery was attempted
        sig { returns(Time) }
        attr_accessor :timestamp

        # Endpoint URL the delivery was sent to
        sig { returns(String) }
        attr_accessor :url

        # Platform webhook ID
        sig { returns(String) }
        attr_accessor :webhook_id

        # Whether this delivery will be retried
        sig { returns(T::Boolean) }
        attr_accessor :will_retry

        # Summary of a platform webhook delivery attempt
        sig do
          params(
            id: String,
            attempt: Integer,
            event:
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::OrSymbol,
            status_code: T.nilable(Integer),
            success: T::Boolean,
            tenant_id: String,
            timestamp: Time,
            url: String,
            webhook_id: String,
            will_retry: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique delivery ID
          id:,
          # Attempt number (1 for first attempt, higher for retries)
          attempt:,
          # Event type
          event:,
          # HTTP status code returned by your endpoint (null if connection failed)
          status_code:,
          # Whether delivery was successful (2xx response)
          success:,
          # Tenant that triggered the event
          tenant_id:,
          # When the delivery was attempted
          timestamp:,
          # Endpoint URL the delivery was sent to
          url:,
          # Platform webhook ID
          webhook_id:,
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
                ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol,
              status_code: T.nilable(Integer),
              success: T::Boolean,
              tenant_id: String,
              timestamp: Time,
              url: String,
              webhook_id: String,
              will_retry: T::Boolean
            }
          )
        end
        def to_hash
        end

        # Event type
        module Event
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event::TaggedSymbol
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
