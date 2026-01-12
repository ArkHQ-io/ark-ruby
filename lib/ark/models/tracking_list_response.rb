# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Tracking#list
    class TrackingListResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::TrackingListResponse::Data, nil]
      optional :data, -> { Ark::Models::TrackingListResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta, nil]
      optional :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::TrackingListResponse::Success, nil]
      optional :success, enum: -> { Ark::Models::TrackingListResponse::Success }

      # @!method initialize(data: nil, meta: nil, success: nil)
      #   @param data [Ark::Models::TrackingListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::TrackingListResponse::Success]

      # @see Ark::Models::TrackingListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute track_domains
        #
        #   @return [Array<Ark::Models::TrackDomain>, nil]
        optional :track_domains,
                 -> {
                   Ark::Internal::Type::ArrayOf[Ark::TrackDomain]
                 },
                 api_name: :trackDomains

        # @!method initialize(track_domains: nil)
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
