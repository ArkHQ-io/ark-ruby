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
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::TrackDomain]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]
    end
  end
end
