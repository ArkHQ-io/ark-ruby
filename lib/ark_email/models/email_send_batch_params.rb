# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_batch
    class EmailSendBatchParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute emails
      #
      #   @return [Array<ArkEmail::Models::EmailSendBatchParams::Email>]
      required :emails, -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::EmailSendBatchParams::Email] }

      # @!attribute from
      #   Sender email for all messages
      #
      #   @return [String]
      required :from, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(emails:, from:, idempotency_key: nil, request_options: {})
      #   @param emails [Array<ArkEmail::Models::EmailSendBatchParams::Email>]
      #
      #   @param from [String] Sender email for all messages
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      class Email < ArkEmail::Internal::Type::BaseModel
        # @!attribute subject
        #
        #   @return [String]
        required :subject, String

        # @!attribute to
        #
        #   @return [Array<String>]
        required :to, ArkEmail::Internal::Type::ArrayOf[String]

        # @!attribute html
        #
        #   @return [String, nil]
        optional :html, String, nil?: true

        # @!attribute metadata
        #   Custom key-value pairs attached to an email for webhook correlation.
        #
        #   When you send an email with metadata, these key-value pairs are:
        #
        #   - **Stored** with the message
        #   - **Returned** in all webhook event payloads (MessageSent, MessageBounced, etc.)
        #   - **Never visible** to email recipients
        #
        #   This is useful for correlating webhook events with your internal systems (e.g.,
        #   user IDs, order IDs, campaign identifiers).
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, ArkEmail::Internal::Type::HashOf[String], nil?: true

        # @!attribute tag
        #
        #   @return [String, nil]
        optional :tag, String, nil?: true

        # @!attribute text
        #
        #   @return [String, nil]
        optional :text, String, nil?: true

        # @!method initialize(subject:, to:, html: nil, metadata: nil, tag: nil, text: nil)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::EmailSendBatchParams::Email} for more details.
        #
        #   @param subject [String]
        #
        #   @param to [Array<String>]
        #
        #   @param html [String, nil]
        #
        #   @param metadata [Hash{Symbol=>String}, nil] Custom key-value pairs attached to an email for webhook correlation.
        #
        #   @param tag [String, nil]
        #
        #   @param text [String, nil]
      end
    end
  end
end
