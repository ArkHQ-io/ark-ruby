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

        # @!attribute tag
        #
        #   @return [String, nil]
        optional :tag, String, nil?: true

        # @!attribute text
        #
        #   @return [String, nil]
        optional :text, String, nil?: true

        # @!method initialize(subject:, to:, html: nil, tag: nil, text: nil)
        #   @param subject [String]
        #   @param to [Array<String>]
        #   @param html [String, nil]
        #   @param tag [String, nil]
        #   @param text [String, nil]
      end
    end
  end
end
