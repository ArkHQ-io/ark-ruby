# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Tracking#update
      class TrackingUpdateResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::TrackDomain]
        required :data, -> { ArkEmail::Tenants::TrackDomain }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::TrackDomain]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]
      end
    end
  end
end
