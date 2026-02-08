# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#retrieve_delivery
      class WebhookRetrieveDeliveryResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data]
        required :data, -> { ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Unique delivery ID
          #
          #   @return [String]
          required :id, String

          # @!attribute attempt
          #   Attempt number
          #
          #   @return [Integer]
          required :attempt, Integer

          # @!attribute event
          #   Event type
          #
          #   @return [String]
          required :event, String

          # @!attribute request
          #   Request details
          #
          #   @return [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request]
          required :request, -> { ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request }

          # @!attribute response
          #   Response details
          #
          #   @return [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response]
          required :response, -> { ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response }

          # @!attribute status_code
          #   HTTP status code from your endpoint
          #
          #   @return [Integer, nil]
          required :status_code, Integer, api_name: :statusCode, nil?: true

          # @!attribute success
          #   Whether delivery was successful
          #
          #   @return [Boolean]
          required :success, ArkEmail::Internal::Type::Boolean

          # @!attribute tenant_id
          #   Tenant that triggered the event
          #
          #   @return [String]
          required :tenant_id, String, api_name: :tenantId

          # @!attribute timestamp
          #   When delivery was attempted
          #
          #   @return [Time]
          required :timestamp, Time

          # @!attribute url
          #   Endpoint URL
          #
          #   @return [String]
          required :url, String

          # @!attribute webhook_id
          #   Platform webhook ID
          #
          #   @return [String]
          required :webhook_id, String, api_name: :webhookId

          # @!attribute webhook_name
          #   Platform webhook name
          #
          #   @return [String]
          required :webhook_name, String, api_name: :webhookName

          # @!attribute will_retry
          #   Whether this will be retried
          #
          #   @return [Boolean]
          required :will_retry, ArkEmail::Internal::Type::Boolean, api_name: :willRetry

          # @!method initialize(id:, attempt:, event:, request:, response:, status_code:, success:, tenant_id:, timestamp:, url:, webhook_id:, webhook_name:, will_retry:)
          #   @param id [String] Unique delivery ID
          #
          #   @param attempt [Integer] Attempt number
          #
          #   @param event [String] Event type
          #
          #   @param request [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Request] Request details
          #
          #   @param response [ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data::Response] Response details
          #
          #   @param status_code [Integer, nil] HTTP status code from your endpoint
          #
          #   @param success [Boolean] Whether delivery was successful
          #
          #   @param tenant_id [String] Tenant that triggered the event
          #
          #   @param timestamp [Time] When delivery was attempted
          #
          #   @param url [String] Endpoint URL
          #
          #   @param webhook_id [String] Platform webhook ID
          #
          #   @param webhook_name [String] Platform webhook name
          #
          #   @param will_retry [Boolean] Whether this will be retried

          # @see ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data#request
          class Request < ArkEmail::Internal::Type::BaseModel
            # @!attribute headers
            #   Request headers including signature
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :headers, ArkEmail::Internal::Type::HashOf[String]

            # @!attribute payload
            #   The complete webhook payload that was sent
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :payload, ArkEmail::Internal::Type::HashOf[ArkEmail::Internal::Type::Unknown]

            # @!method initialize(headers: nil, payload: nil)
            #   Request details
            #
            #   @param headers [Hash{Symbol=>String}] Request headers including signature
            #
            #   @param payload [Hash{Symbol=>Object}] The complete webhook payload that was sent
          end

          # @see ArkEmail::Models::Platform::WebhookRetrieveDeliveryResponse::Data#response
          class Response < ArkEmail::Internal::Type::BaseModel
            # @!attribute body
            #   Response body (truncated if too large)
            #
            #   @return [String, nil]
            optional :body, String, nil?: true

            # @!attribute duration
            #   Response time in milliseconds
            #
            #   @return [Integer, nil]
            optional :duration, Integer

            # @!method initialize(body: nil, duration: nil)
            #   Response details
            #
            #   @param body [String, nil] Response body (truncated if too large)
            #
            #   @param duration [Integer] Response time in milliseconds
          end
        end
      end
    end
  end
end
