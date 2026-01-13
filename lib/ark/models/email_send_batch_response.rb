# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#send_batch
    class EmailSendBatchResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::EmailSendBatchResponse::Data]
      required :data, -> { Ark::Models::EmailSendBatchResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::EmailSendBatchResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::EmailSendBatchResponse#data
      class Data < Ark::Internal::Type::BaseModel
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
        #   @return [Hash{Symbol=>Ark::Models::EmailSendBatchResponse::Data::Message}]
        required :messages, -> { Ark::Internal::Type::HashOf[Ark::Models::EmailSendBatchResponse::Data::Message] }

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
        #   @param messages [Hash{Symbol=>Ark::Models::EmailSendBatchResponse::Data::Message}] Map of recipient email to message info
        #
        #   @param total [Integer] Total emails in the batch

        class Message < Ark::Internal::Type::BaseModel
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
