# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#send_
    class EmailSendResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::EmailSendResponse::Data]
      required :data, -> { Ark::Models::EmailSendResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::EmailSendResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::EmailSendResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute id
        #   Unique message ID (format: msg*{id}*{token})
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #   Current delivery status
        #
        #   @return [Symbol, Ark::Models::EmailSendResponse::Data::Status]
        required :status, enum: -> { Ark::Models::EmailSendResponse::Data::Status }

        # @!attribute to
        #   List of recipient addresses
        #
        #   @return [Array<String>]
        required :to, Ark::Internal::Type::ArrayOf[String]

        # @!attribute message_id
        #   SMTP Message-ID header value
        #
        #   @return [String, nil]
        optional :message_id, String, api_name: :messageId

        # @!method initialize(id:, status:, to:, message_id: nil)
        #   @param id [String] Unique message ID (format: msg*{id}*{token})
        #
        #   @param status [Symbol, Ark::Models::EmailSendResponse::Data::Status] Current delivery status
        #
        #   @param to [Array<String>] List of recipient addresses
        #
        #   @param message_id [String] SMTP Message-ID header value

        # Current delivery status
        #
        # @see Ark::Models::EmailSendResponse::Data#status
        module Status
          extend Ark::Internal::Type::Enum

          PENDING = :pending
          SENT = :sent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
