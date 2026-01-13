# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tracking#create
    class TrackingCreateResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::TrackDomain]
      required :data, -> { ArkEmail::TrackDomain }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::TrackDomain]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]
    end
  end
end
