# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Domains#delete
    class SuccessResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuccessResponse::Data]
      required :data, -> { Ark::SuccessResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::SuccessResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::SuccessResponse#data
      class Data < Ark::Internal::Type::BaseModel
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
