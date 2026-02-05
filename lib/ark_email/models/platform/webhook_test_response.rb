# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#test_
      class WebhookTestResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Platform::WebhookTestResponse::Data]
        required :data, -> { ArkEmail::Models::Platform::WebhookTestResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Platform::WebhookTestResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Platform::WebhookTestResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute duration_ms
          #   Request duration in milliseconds
          #
          #   @return [Integer]
          required :duration_ms, Integer, api_name: :durationMs

          # @!attribute status_code
          #   HTTP status code from the webhook endpoint
          #
          #   @return [Integer]
          required :status_code, Integer, api_name: :statusCode

          # @!attribute success
          #   Whether the webhook endpoint responded with a 2xx status
          #
          #   @return [Boolean]
          required :success, ArkEmail::Internal::Type::Boolean

          # @!attribute error
          #   Error message if the request failed
          #
          #   @return [String, nil]
          optional :error, String, nil?: true

          # @!method initialize(duration_ms:, status_code:, success:, error: nil)
          #   @param duration_ms [Integer] Request duration in milliseconds
          #
          #   @param status_code [Integer] HTTP status code from the webhook endpoint
          #
          #   @param success [Boolean] Whether the webhook endpoint responded with a 2xx status
          #
          #   @param error [String, nil] Error message if the request failed
        end
      end
    end
  end
end
