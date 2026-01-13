# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#test_
    class WebhookTestResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::WebhookTestResponse::Data]
      required :data, -> { Ark::Models::WebhookTestResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::WebhookTestResponse::Success]
      required :success, enum: -> { Ark::Models::WebhookTestResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::WebhookTestResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::WebhookTestResponse::Success]

      # @see Ark::Models::WebhookTestResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute duration
        #   Request duration in milliseconds
        #
        #   @return [Integer]
        required :duration, Integer

        # @!attribute event
        #   Event type that was tested
        #
        #   @return [String]
        required :event, String

        # @!attribute status_code
        #   HTTP status code from the webhook endpoint
        #
        #   @return [Integer, nil]
        required :status_code, Integer, api_name: :statusCode, nil?: true

        # @!attribute success
        #   Whether the webhook endpoint responded with a 2xx status
        #
        #   @return [Boolean]
        required :success, Ark::Internal::Type::Boolean

        # @!attribute body
        #   Response body from the webhook endpoint (truncated if too long)
        #
        #   @return [String, nil]
        optional :body, String, nil?: true

        # @!attribute error
        #   Error message if the request failed
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!method initialize(duration:, event:, status_code:, success:, body: nil, error: nil)
        #   @param duration [Integer] Request duration in milliseconds
        #
        #   @param event [String] Event type that was tested
        #
        #   @param status_code [Integer, nil] HTTP status code from the webhook endpoint
        #
        #   @param success [Boolean] Whether the webhook endpoint responded with a 2xx status
        #
        #   @param body [String, nil] Response body from the webhook endpoint (truncated if too long)
        #
        #   @param error [String, nil] Error message if the request failed
      end

      # @see Ark::Models::WebhookTestResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
