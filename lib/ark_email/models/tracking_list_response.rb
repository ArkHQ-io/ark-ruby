# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tracking#list
    class TrackingListResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::TrackingListResponse::Data]
      required :data, -> { ArkEmail::Models::TrackingListResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::TrackingListResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::TrackingListResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute track_domains
        #
        #   @return [Array<ArkEmail::Models::TrackDomain>]
        required :track_domains,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::TrackDomain] },
                 api_name: :trackDomains

        # @!method initialize(track_domains:)
        #   @param track_domains [Array<ArkEmail::Models::TrackDomain>]
      end
    end
  end
end
