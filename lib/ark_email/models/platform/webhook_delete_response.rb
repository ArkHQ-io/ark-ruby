# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#delete
      class WebhookDeleteResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Platform::WebhookDeleteResponse::Data]
        required :data, -> { ArkEmail::Models::Platform::WebhookDeleteResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Platform::WebhookDeleteResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Platform::WebhookDeleteResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!method initialize(message:)
          #   @param message [String]
        end
      end
    end
  end
end
