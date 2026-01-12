# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Tracking#list
    class TrackingListResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::TrackingListResponse::Data]
      required :data, -> { Ark::Models::TrackingListResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::TrackingListResponse::Success]
      required :success, enum: -> { Ark::Models::TrackingListResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::TrackingListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::TrackingListResponse::Success]

      # @see Ark::Models::TrackingListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute track_domains
        #
        #   @return [Array<Ark::Models::TrackDomain>]
        required :track_domains,
                 -> {
                   Ark::Internal::Type::ArrayOf[Ark::TrackDomain]
                 },
                 api_name: :trackDomains

        # @!method initialize(track_domains:)
        #   @param track_domains [Array<Ark::Models::TrackDomain>]
      end

      # @see Ark::Models::TrackingListResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
