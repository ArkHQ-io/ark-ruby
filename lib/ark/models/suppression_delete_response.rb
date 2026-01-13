# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#delete
    class SuppressionDeleteResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuppressionDeleteResponse::Data]
      required :data, -> { Ark::Models::SuppressionDeleteResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::SuppressionDeleteResponse::Success]
      required :success, enum: -> { Ark::Models::SuppressionDeleteResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::SuppressionDeleteResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::SuppressionDeleteResponse::Success]

      # @see Ark::Models::SuppressionDeleteResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end

      # @see Ark::Models::SuppressionDeleteResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
