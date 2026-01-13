# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Tracking#update
    class TrackingUpdateResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::TrackDomain]
      required :data, -> { Ark::TrackDomain }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::TrackingUpdateResponse::Success]
      required :success, enum: -> { Ark::Models::TrackingUpdateResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::TrackDomain]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::TrackingUpdateResponse::Success]

      # @see Ark::Models::TrackingUpdateResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
