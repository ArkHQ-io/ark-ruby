# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Tracking#create
    class TrackDomainResponse < Ark::Internal::Type::BaseModel
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
      #   @return [Boolean, Ark::Models::TrackDomainResponse::Success]
      required :success, enum: -> { Ark::TrackDomainResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::TrackDomain]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::TrackDomainResponse::Success]

      # @see Ark::Models::TrackDomainResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
