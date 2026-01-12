# frozen_string_literal: true

module Ark
  module Models
    class Delivery < Ark::Internal::Type::BaseModel
      # @!attribute id
      #   Delivery attempt ID
      #
      #   @return [String]
      required :id, String

      # @!attribute status
      #   Delivery status (lowercase)
      #
      #   @return [String]
      required :status, String

      # @!attribute timestamp
      #   Unix timestamp
      #
      #   @return [Float]
      required :timestamp, Float

      # @!attribute timestamp_iso
      #   ISO 8601 timestamp
      #
      #   @return [Time]
      required :timestamp_iso, Time, api_name: :timestampIso

      # @!attribute code
      #   SMTP response code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute details
      #   Status details
      #
      #   @return [String, nil]
      optional :details, String

      # @!attribute output
      #   SMTP server response from the receiving mail server
      #
      #   @return [String, nil]
      optional :output, String

      # @!attribute sent_with_ssl
      #   Whether TLS was used
      #
      #   @return [Boolean, nil]
      optional :sent_with_ssl, Ark::Internal::Type::Boolean, api_name: :sentWithSsl

      # @!method initialize(id:, status:, timestamp:, timestamp_iso:, code: nil, details: nil, output: nil, sent_with_ssl: nil)
      #   @param id [String] Delivery attempt ID
      #
      #   @param status [String] Delivery status (lowercase)
      #
      #   @param timestamp [Float] Unix timestamp
      #
      #   @param timestamp_iso [Time] ISO 8601 timestamp
      #
      #   @param code [Integer] SMTP response code
      #
      #   @param details [String] Status details
      #
      #   @param output [String] SMTP server response from the receiving mail server
      #
      #   @param sent_with_ssl [Boolean] Whether TLS was used
    end
  end
end
