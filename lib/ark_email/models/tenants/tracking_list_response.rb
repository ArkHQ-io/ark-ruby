# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Tracking#list
      class TrackingListResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::TrackingListResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::TrackingListResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::TrackingListResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::TrackingListResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute track_domains
          #
          #   @return [Array<ArkEmail::Models::Tenants::TrackDomain>]
          required :track_domains,
                   -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Tenants::TrackDomain] },
                   api_name: :trackDomains

          # @!method initialize(track_domains:)
          #   @param track_domains [Array<ArkEmail::Models::Tenants::TrackDomain>]
        end
      end
    end
  end
end
