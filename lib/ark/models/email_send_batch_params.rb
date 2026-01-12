# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#send_batch
    class EmailSendBatchParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute emails
      #
      #   @return [Array<Ark::Models::EmailSendBatchParams::Email>]
      required :emails, -> { Ark::Internal::Type::ArrayOf[Ark::EmailSendBatchParams::Email] }

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
      #   @param emails [Array<Ark::Models::EmailSendBatchParams::Email>]
      #
      #   @param from [String] Sender email for all messages
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]

      class Email < Ark::Internal::Type::BaseModel
        # @!attribute subject
        #
        #   @return [String]
        required :subject, String

        # @!attribute to
        #
        #   @return [Array<String>]
        required :to, Ark::Internal::Type::ArrayOf[String]

        # @!attribute html
        #
        #   @return [String, nil]
        optional :html, String

        # @!attribute tag
        #
        #   @return [String, nil]
        optional :tag, String

        # @!attribute text
        #
        #   @return [String, nil]
        optional :text, String

        # @!method initialize(subject:, to:, html: nil, tag: nil, text: nil)
        #   @param subject [String]
        #   @param to [Array<String>]
        #   @param html [String]
        #   @param tag [String]
        #   @param text [String]
      end
    end
  end
end
