# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#list_deliveries
      class WebhookListDeliveriesResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Unique delivery ID
        #
        #   @return [String]
        required :id, String

        # @!attribute attempt
        #   Attempt number (1 for first attempt, higher for retries)
        #
        #   @return [Integer]
        required :attempt, Integer

        # @!attribute event
        #   Event type
        #
        #   @return [Symbol, ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event]
        required :event, enum: -> { ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event }

        # @!attribute status_code
        #   HTTP status code returned by your endpoint (null if connection failed)
        #
        #   @return [Integer, nil]
        required :status_code, Integer, api_name: :statusCode, nil?: true

        # @!attribute success
        #   Whether delivery was successful (2xx response)
        #
        #   @return [Boolean]
        required :success, ArkEmail::Internal::Type::Boolean

        # @!attribute tenant_id
        #   Tenant that triggered the event
        #
        #   @return [String]
        required :tenant_id, String, api_name: :tenantId

        # @!attribute timestamp
        #   When the delivery was attempted
        #
        #   @return [Time]
        required :timestamp, Time

        # @!attribute url
        #   Endpoint URL the delivery was sent to
        #
        #   @return [String]
        required :url, String

        # @!attribute webhook_id
        #   Platform webhook ID
        #
        #   @return [String]
        required :webhook_id, String, api_name: :webhookId

        # @!attribute will_retry
        #   Whether this delivery will be retried
        #
        #   @return [Boolean]
        required :will_retry, ArkEmail::Internal::Type::Boolean, api_name: :willRetry

        # @!method initialize(id:, attempt:, event:, status_code:, success:, tenant_id:, timestamp:, url:, webhook_id:, will_retry:)
        #   Summary of a platform webhook delivery attempt
        #
        #   @param id [String] Unique delivery ID
        #
        #   @param attempt [Integer] Attempt number (1 for first attempt, higher for retries)
        #
        #   @param event [Symbol, ArkEmail::Models::Platform::WebhookListDeliveriesResponse::Event] Event type
        #
        #   @param status_code [Integer, nil] HTTP status code returned by your endpoint (null if connection failed)
        #
        #   @param success [Boolean] Whether delivery was successful (2xx response)
        #
        #   @param tenant_id [String] Tenant that triggered the event
        #
        #   @param timestamp [Time] When the delivery was attempted
        #
        #   @param url [String] Endpoint URL the delivery was sent to
        #
        #   @param webhook_id [String] Platform webhook ID
        #
        #   @param will_retry [Boolean] Whether this delivery will be retried

        # Event type
        #
        # @see ArkEmail::Models::Platform::WebhookListDeliveriesResponse#event
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

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
