# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Logs#retrieve
    class LogRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #   Full API request log entry with bodies
      #
      #   @return [ArkEmail::Models::LogEntryDetail]
      required :data, -> { ArkEmail::LogEntryDetail }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   Detailed API request log with request/response bodies
      #
      #   @param data [ArkEmail::Models::LogEntryDetail] Full API request log entry with bodies
      #
      #   @param meta [ArkEmail::Models::APIMeta]
      #
      #   @param success [Boolean, true]
    end
  end
end
