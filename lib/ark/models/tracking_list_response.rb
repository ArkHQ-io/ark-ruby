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
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::TrackingListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

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
    end
  end
end
