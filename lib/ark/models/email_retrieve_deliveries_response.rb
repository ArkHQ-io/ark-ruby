# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#retrieve_deliveries
    class EmailRetrieveDeliveriesResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::EmailRetrieveDeliveriesResponse::Data]
      required :data, -> { Ark::Models::EmailRetrieveDeliveriesResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::EmailRetrieveDeliveriesResponse::Success]
      required :success, enum: -> { Ark::Models::EmailRetrieveDeliveriesResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::EmailRetrieveDeliveriesResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::EmailRetrieveDeliveriesResponse::Success]

      # @see Ark::Models::EmailRetrieveDeliveriesResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute deliveries
        #
        #   @return [Array<Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery>]
        required :deliveries,
                 -> { Ark::Internal::Type::ArrayOf[Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery] }

        # @!attribute message_id
        #   Internal message ID
        #
        #   @return [String]
        required :message_id, String, api_name: :messageId

        # @!attribute message_token
        #   Message token
        #
        #   @return [String]
        required :message_token, String, api_name: :messageToken

        # @!method initialize(deliveries:, message_id:, message_token:)
        #   @param deliveries [Array<Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery>]
        #
        #   @param message_id [String] Internal message ID
        #
        #   @param message_token [String] Message token

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

      # @see Ark::Models::EmailRetrieveDeliveriesResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
