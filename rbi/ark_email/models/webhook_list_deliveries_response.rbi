# typed: strong

module ArkEmail
  module Models
    class WebhookListDeliveriesResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::WebhookListDeliveriesResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[ArkEmail::Models::WebhookListDeliveriesResponse::Data])
      end
      attr_accessor :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      # Current page number
      sig { returns(Integer) }
      attr_accessor :page

      # Items per page
      sig { returns(Integer) }
      attr_accessor :per_page

      # Total number of deliveries matching the filter
      sig { returns(Integer) }
      attr_accessor :total

      # Total number of pages
      sig { returns(Integer) }
      attr_accessor :total_pages

      # Paginated list of webhook delivery attempts
      sig do
        params(
          data:
            T::Array[
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::OrHash
            ],
          meta: ArkEmail::APIMeta::OrHash,
          page: Integer,
          per_page: Integer,
          total: Integer,
          total_pages: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        meta:,
        # Current page number
        page:,
        # Items per page
        per_page:,
        # Total number of deliveries matching the filter
        total:,
        # Total number of pages
        total_pages:
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[ArkEmail::Models::WebhookListDeliveriesResponse::Data],
            meta: ArkEmail::APIMeta,
            page: Integer,
            per_page: Integer,
            total: Integer,
            total_pages: Integer
          }
        )
      end
      def to_hash
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::WebhookListDeliveriesResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Unique delivery ID (UUID)
        sig { returns(String) }
        attr_accessor :id

        # Attempt number (1 for first attempt, increments with retries)
        sig { returns(Integer) }
        attr_accessor :attempt

        # Event type that triggered this delivery
        sig do
          returns(
            ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
          )
        end
        attr_accessor :event

        # HTTP status code returned by the endpoint (null if connection failed)
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

        # Whether this delivery will be retried (true if failed and retries remaining)
        sig { returns(T::Boolean) }
        attr_accessor :will_retry

        # Summary of a webhook delivery attempt
        sig do
          params(
            id: String,
            attempt: Integer,
            event:
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::OrSymbol,
            status_code: T.nilable(Integer),
            success: T::Boolean,
            timestamp: Time,
            url: String,
            webhook_id: String,
            will_retry: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique delivery ID (UUID)
          id:,
          # Attempt number (1 for first attempt, increments with retries)
          attempt:,
          # Event type that triggered this delivery
          event:,
          # HTTP status code returned by the endpoint (null if connection failed)
          status_code:,
          # Whether the delivery was successful (2xx response)
          success:,
          # When this delivery attempt occurred
          timestamp:,
          # URL the webhook was delivered to
          url:,
          # ID of the webhook this delivery belongs to
          webhook_id:,
          # Whether this delivery will be retried (true if failed and retries remaining)
          will_retry:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              attempt: Integer,
              event:
                ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol,
              status_code: T.nilable(Integer),
              success: T::Boolean,
              timestamp: Time,
              url: String,
              webhook_id: String,
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
                ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          SEND_LIMIT_APPROACHING =
            T.let(
              :SendLimitApproaching,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )
          SEND_LIMIT_EXCEEDED =
            T.let(
              :SendLimitExceeded,
              ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event::TaggedSymbol
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
