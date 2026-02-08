# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Webhooks#retrieve_delivery
      class WebhookRetrieveDeliveryResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #   Full details of a webhook delivery including request and response
        #
        #   @return [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   Detailed information about a webhook delivery attempt
        #
        #   @param data [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data] Full details of a webhook delivery including request and response
        #
        #   @param meta [ArkEmail::Models::APIMeta]
        #
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Unique delivery ID (UUID)
          #
          #   @return [String]
          required :id, String

          # @!attribute attempt
          #   Attempt number for this delivery
          #
          #   @return [Integer]
          required :attempt, Integer

          # @!attribute event
          #   Event type that triggered this delivery
          #
          #   @return [Symbol, ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event]
          required :event, enum: -> { ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event }

          # @!attribute request
          #   The request that was sent to your endpoint
          #
          #   @return [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request]
          required :request, -> { ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request }

          # @!attribute response
          #   The response received from your endpoint
          #
          #   @return [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response]
          required :response, -> { ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response }

          # @!attribute status_code
          #   HTTP status code returned by the endpoint
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

          # @!attribute webhook_name
          #   Name of the webhook for easy identification
          #
          #   @return [String]
          required :webhook_name, String, api_name: :webhookName

          # @!attribute will_retry
          #   Whether this delivery will be retried
          #
          #   @return [Boolean]
          required :will_retry, ArkEmail::Internal::Type::Boolean, api_name: :willRetry

          # @!method initialize(id:, attempt:, event:, request:, response:, status_code:, success:, timestamp:, url:, webhook_id:, webhook_name:, will_retry:)
          #   Full details of a webhook delivery including request and response
          #
          #   @param id [String] Unique delivery ID (UUID)
          #
          #   @param attempt [Integer] Attempt number for this delivery
          #
          #   @param event [Symbol, ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Event] Event type that triggered this delivery
          #
          #   @param request [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Request] The request that was sent to your endpoint
          #
          #   @param response [ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data::Response] The response received from your endpoint
          #
          #   @param status_code [Integer, nil] HTTP status code returned by the endpoint
          #
          #   @param success [Boolean] Whether the delivery was successful (2xx response)
          #
          #   @param timestamp [Time] When this delivery attempt occurred
          #
          #   @param url [String] URL the webhook was delivered to
          #
          #   @param webhook_id [String] ID of the webhook this delivery belongs to
          #
          #   @param webhook_name [String] Name of the webhook for easy identification
          #
          #   @param will_retry [Boolean] Whether this delivery will be retried

          # Event type that triggered this delivery
          #
          # @see ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data#event
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

          # @see ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data#request
          class Request < ArkEmail::Internal::Type::BaseModel
            # @!attribute headers
            #   HTTP headers that were sent with the request
            #
            #   @return [Hash{Symbol=>String}]
            required :headers, ArkEmail::Internal::Type::HashOf[String]

            # @!attribute payload
            #   The complete webhook payload that was sent
            #
            #   @return [Hash{Symbol=>Object}]
            required :payload, ArkEmail::Internal::Type::HashOf[ArkEmail::Internal::Type::Unknown]

            # @!method initialize(headers:, payload:)
            #   The request that was sent to your endpoint
            #
            #   @param headers [Hash{Symbol=>String}] HTTP headers that were sent with the request
            #
            #   @param payload [Hash{Symbol=>Object}] The complete webhook payload that was sent
          end

          # @see ArkEmail::Models::Tenants::WebhookRetrieveDeliveryResponse::Data#response
          class Response < ArkEmail::Internal::Type::BaseModel
            # @!attribute status_code
            #   HTTP status code from your endpoint
            #
            #   @return [Integer, nil]
            required :status_code, Integer, api_name: :statusCode, nil?: true

            # @!attribute body
            #   Response body from your endpoint (may be truncated)
            #
            #   @return [String, nil]
            optional :body, String, nil?: true

            # @!method initialize(status_code:, body: nil)
            #   The response received from your endpoint
            #
            #   @param status_code [Integer, nil] HTTP status code from your endpoint
            #
            #   @param body [String, nil] Response body from your endpoint (may be truncated)
          end
        end
      end
    end
  end
end
