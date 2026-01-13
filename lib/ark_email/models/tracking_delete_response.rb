# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tracking#delete
    class TrackingDeleteResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::TrackingDeleteResponse::Data]
      required :data, -> { ArkEmail::Models::TrackingDeleteResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::TrackingDeleteResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::TrackingDeleteResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end
    end
  end
end
