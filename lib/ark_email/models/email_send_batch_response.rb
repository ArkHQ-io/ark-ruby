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

        # @!attribute total
        #   Total emails in the batch
        #
        #   @return [Integer]
        required :total, Integer

        # @!method initialize(accepted:, failed:, messages:, total:)
        #   @param accepted [Integer] Successfully accepted emails
        #
        #   @param failed [Integer] Failed emails
        #
        #   @param messages [Hash{Symbol=>ArkEmail::Models::EmailSendBatchResponse::Data::Message}] Map of recipient email to message info
        #
        #   @param total [Integer] Total emails in the batch

        class Message < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Message ID
          #
          #   @return [String]
          required :id, String

          # @!attribute token
          #
          #   @return [String]
          required :token, String

          # @!method initialize(id:, token:)
          #   @param id [String] Message ID
          #
          #   @param token [String]
        end
      end
    end
  end
end
