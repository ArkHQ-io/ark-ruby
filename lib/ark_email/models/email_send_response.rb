# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_
    class EmailSendResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::EmailSendResponse::Data]
      required :data, -> { ArkEmail::Models::EmailSendResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::EmailSendResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::EmailSendResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Unique message identifier (token)
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #   Current delivery status
        #
        #   @return [Symbol, ArkEmail::Models::EmailSendResponse::Data::Status]
        required :status, enum: -> { ArkEmail::Models::EmailSendResponse::Data::Status }

        # @!attribute tenant_id
        #   The tenant ID this email was sent from
        #
        #   @return [String]
        required :tenant_id, String, api_name: :tenantId

        # @!attribute to
        #   List of recipient addresses
        #
        #   @return [Array<String>]
        required :to, ArkEmail::Internal::Type::ArrayOf[String]

        # @!attribute message_id
        #   SMTP Message-ID header value
        #
        #   @return [String, nil]
        optional :message_id, String, api_name: :messageId

        # @!attribute sandbox
        #   Whether this email was sent in sandbox mode. Only present (and true) for sandbox
        #   emails sent from @arkhq.io addresses.
        #
        #   @return [Boolean, nil]
        optional :sandbox, ArkEmail::Internal::Type::Boolean

        # @!method initialize(id:, status:, tenant_id:, to:, message_id: nil, sandbox: nil)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::EmailSendResponse::Data} for more details.
        #
        #   @param id [String] Unique message identifier (token)
        #
        #   @param status [Symbol, ArkEmail::Models::EmailSendResponse::Data::Status] Current delivery status
        #
        #   @param tenant_id [String] The tenant ID this email was sent from
        #
        #   @param to [Array<String>] List of recipient addresses
        #
        #   @param message_id [String] SMTP Message-ID header value
        #
        #   @param sandbox [Boolean] Whether this email was sent in sandbox mode.

        # Current delivery status
        #
        # @see ArkEmail::Models::EmailSendResponse::Data#status
        module Status
          extend ArkEmail::Internal::Type::Enum

          PENDING = :pending
          SENT = :sent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
