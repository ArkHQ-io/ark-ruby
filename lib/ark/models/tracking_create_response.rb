# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Tracking#create
    class TrackingCreateResponse < Ark::Internal::Type::BaseModel
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
      #   @return [Boolean, Ark::Models::TrackingCreateResponse::Success]
      required :success, enum: -> { Ark::Models::TrackingCreateResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::TrackDomain]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::TrackingCreateResponse::Success]

      # @see Ark::Models::TrackingCreateResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
