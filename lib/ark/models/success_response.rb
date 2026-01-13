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
      #   @return [Boolean, Ark::Models::SuccessResponse::Success]
      required :success, enum: -> { Ark::SuccessResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::SuccessResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::SuccessResponse::Success]

      # @see Ark::Models::SuccessResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end

      # @see Ark::Models::SuccessResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
