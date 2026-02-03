# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#retrieve
    class UsageRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #   Current usage and limit information
      #
      #   @return [ArkEmail::Models::LimitsData]
      required :data, -> { ArkEmail::LimitsData }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   Account usage and limits response
      #
      #   @param data [ArkEmail::Models::LimitsData] Current usage and limit information
      #
      #   @param meta [ArkEmail::Models::APIMeta]
      #
      #   @param success [Boolean, true]
    end
  end
end
