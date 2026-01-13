# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Tracking#delete
    class TrackingDeleteResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::TrackingDeleteResponse::Data]
      required :data, -> { Ark::Models::TrackingDeleteResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::TrackingDeleteResponse::Success]
      required :success, enum: -> { Ark::Models::TrackingDeleteResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::TrackingDeleteResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::TrackingDeleteResponse::Success]

      # @see Ark::Models::TrackingDeleteResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end

      # @see Ark::Models::TrackingDeleteResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
