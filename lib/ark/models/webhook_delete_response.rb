# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#delete
    class WebhookDeleteResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::WebhookDeleteResponse::Data]
      required :data, -> { Ark::Models::WebhookDeleteResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::WebhookDeleteResponse::Success]
      required :success, enum: -> { Ark::Models::WebhookDeleteResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::WebhookDeleteResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::WebhookDeleteResponse::Success]

      # @see Ark::Models::WebhookDeleteResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end

      # @see Ark::Models::WebhookDeleteResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
