# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_batch
    class EmailSendBatchResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::EmailSendBatchResponse::Data]
      required :data, -> { ArkEmail::Models::EmailSendBatchResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::EmailSendBatchResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::EmailSendBatchResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute accepted
        #   Successfully accepted emails
        #
        #   @return [Integer]
        required :accepted, Integer

        # @!attribute failed
        #   Failed emails
        #
        #   @return [Integer]
        required :failed, Integer

        # @!attribute messages
        #   Map of recipient email to message info
        #
        #   @return [Hash{Symbol=>ArkEmail::Models::EmailSendBatchResponse::Data::Message}]
        required :messages,
                 -> { ArkEmail::Internal::Type::HashOf[ArkEmail::Models::EmailSendBatchResponse::Data::Message] }

        # @!attribute tenant_id
        #   The tenant ID this batch was sent from
        #
        #   @return [String]
        required :tenant_id, String, api_name: :tenantId

        # @!attribute total
        #   Total emails in the batch
        #
        #   @return [Integer]
        required :total, Integer

        # @!attribute sandbox
        #   Whether this batch was sent in sandbox mode. Only present (and true) for sandbox
        #   emails sent from @arkhq.io addresses.
        #
        #   @return [Boolean, nil]
        optional :sandbox, ArkEmail::Internal::Type::Boolean

        # @!method initialize(accepted:, failed:, messages:, tenant_id:, total:, sandbox: nil)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::EmailSendBatchResponse::Data} for more details.
        #
        #   @param accepted [Integer] Successfully accepted emails
        #
        #   @param failed [Integer] Failed emails
        #
        #   @param messages [Hash{Symbol=>ArkEmail::Models::EmailSendBatchResponse::Data::Message}] Map of recipient email to message info
        #
        #   @param tenant_id [String] The tenant ID this batch was sent from
        #
        #   @param total [Integer] Total emails in the batch
        #
        #   @param sandbox [Boolean] Whether this batch was sent in sandbox mode.

        class Message < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Message identifier (token)
          #
          #   @return [String]
          required :id, String

          # @!method initialize(id:)
          #   @param id [String] Message identifier (token)
        end
      end
    end
  end
end
