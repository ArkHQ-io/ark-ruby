# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Webhooks#list_deliveries
    class WebhookListDeliveriesResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ArkEmail::Models::WebhookListDeliveriesResponse::Data>]
      required :data,
               -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::WebhookListDeliveriesResponse::Data] }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute page
      #   Current page number
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute per_page
      #   Items per page
      #
      #   @return [Integer]
      required :per_page, Integer, api_name: :perPage

      # @!attribute total
      #   Total number of deliveries matching the filter
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute total_pages
      #   Total number of pages
      #
      #   @return [Integer]
      required :total_pages, Integer, api_name: :totalPages

      # @!method initialize(data:, meta:, page:, per_page:, total:, total_pages:)
      #   Paginated list of webhook delivery attempts
      #
      #   @param data [Array<ArkEmail::Models::WebhookListDeliveriesResponse::Data>]
      #
      #   @param meta [ArkEmail::Models::APIMeta]
      #
      #   @param page [Integer] Current page number
      #
      #   @param per_page [Integer] Items per page
      #
      #   @param total [Integer] Total number of deliveries matching the filter
      #
      #   @param total_pages [Integer] Total number of pages

      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Unique delivery ID (UUID)
        #
        #   @return [String]
        required :id, String

        # @!attribute attempt
        #   Attempt number (1 for first attempt, increments with retries)
        #
        #   @return [Integer]
        required :attempt, Integer

        # @!attribute event
        #   Event type that triggered this delivery
        #
        #   @return [Symbol, ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event]
        required :event, enum: -> { ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event }

        # @!attribute status_code
        #   HTTP status code returned by the endpoint (null if connection failed)
        #
        #   @return [Integer, nil]
        required :status_code, Integer, api_name: :statusCode, nil?: true

        # @!attribute success
        #   Whether the delivery was successful (2xx response)
        #
        #   @return [Boolean]
        required :success, ArkEmail::Internal::Type::Boolean

        # @!attribute timestamp
        #   When this delivery attempt occurred
        #
        #   @return [Time]
        required :timestamp, Time

        # @!attribute url
        #   URL the webhook was delivered to
        #
        #   @return [String]
        required :url, String

        # @!attribute webhook_id
        #   ID of the webhook this delivery belongs to
        #
        #   @return [String]
        required :webhook_id, String, api_name: :webhookId

        # @!attribute will_retry
        #   Whether this delivery will be retried (true if failed and retries remaining)
        #
        #   @return [Boolean]
        required :will_retry, ArkEmail::Internal::Type::Boolean, api_name: :willRetry

        # @!method initialize(id:, attempt:, event:, status_code:, success:, timestamp:, url:, webhook_id:, will_retry:)
        #   Summary of a webhook delivery attempt
        #
        #   @param id [String] Unique delivery ID (UUID)
        #
        #   @param attempt [Integer] Attempt number (1 for first attempt, increments with retries)
        #
        #   @param event [Symbol, ArkEmail::Models::WebhookListDeliveriesResponse::Data::Event] Event type that triggered this delivery
        #
        #   @param status_code [Integer, nil] HTTP status code returned by the endpoint (null if connection failed)
        #
        #   @param success [Boolean] Whether the delivery was successful (2xx response)
        #
        #   @param timestamp [Time] When this delivery attempt occurred
        #
        #   @param url [String] URL the webhook was delivered to
        #
        #   @param webhook_id [String] ID of the webhook this delivery belongs to
        #
        #   @param will_retry [Boolean] Whether this delivery will be retried (true if failed and retries remaining)

        # Event type that triggered this delivery
        #
        # @see ArkEmail::Models::WebhookListDeliveriesResponse::Data#event
        module Event
          extend ArkEmail::Internal::Type::Enum

          MESSAGE_SENT = :MessageSent
          MESSAGE_DELAYED = :MessageDelayed
          MESSAGE_DELIVERY_FAILED = :MessageDeliveryFailed
          MESSAGE_HELD = :MessageHeld
          MESSAGE_BOUNCED = :MessageBounced
          MESSAGE_LINK_CLICKED = :MessageLinkClicked
          MESSAGE_LOADED = :MessageLoaded
          DOMAIN_DNS_ERROR = :DomainDNSError
          SEND_LIMIT_APPROACHING = :SendLimitApproaching
          SEND_LIMIT_EXCEEDED = :SendLimitExceeded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
