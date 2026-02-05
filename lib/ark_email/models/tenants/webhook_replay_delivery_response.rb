# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Webhooks#replay_delivery
      class WebhookReplayDeliveryResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   Result of replaying a webhook delivery
        #
        #   @param data [ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::WebhookReplayDeliveryResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute duration
          #   Request duration in milliseconds
          #
          #   @return [Integer]
          required :duration, Integer

          # @!attribute new_delivery_id
          #   ID of the new delivery created by the replay
          #
          #   @return [String]
          required :new_delivery_id, String, api_name: :newDeliveryId

          # @!attribute original_delivery_id
          #   ID of the original delivery that was replayed
          #
          #   @return [String]
          required :original_delivery_id, String, api_name: :originalDeliveryId

          # @!attribute status_code
          #   HTTP status code from your endpoint
          #
          #   @return [Integer, nil]
          required :status_code, Integer, api_name: :statusCode, nil?: true

          # @!attribute success
          #   Whether the replay was successful (2xx response from endpoint)
          #
          #   @return [Boolean]
          required :success, ArkEmail::Internal::Type::Boolean

          # @!attribute timestamp
          #   When the replay was executed
          #
          #   @return [Time]
          required :timestamp, Time

          # @!method initialize(duration:, new_delivery_id:, original_delivery_id:, status_code:, success:, timestamp:)
          #   @param duration [Integer] Request duration in milliseconds
          #
          #   @param new_delivery_id [String] ID of the new delivery created by the replay
          #
          #   @param original_delivery_id [String] ID of the original delivery that was replayed
          #
          #   @param status_code [Integer, nil] HTTP status code from your endpoint
          #
          #   @param success [Boolean] Whether the replay was successful (2xx response from endpoint)
          #
          #   @param timestamp [Time] When the replay was executed
        end
      end
    end
  end
end
