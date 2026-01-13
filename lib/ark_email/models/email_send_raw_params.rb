# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_raw
    class EmailSendRawParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute data
      #   Base64-encoded RFC 2822 message
      #
      #   @return [String]
      required :data, String

      # @!attribute mail_from
      #   Envelope sender address
      #
      #   @return [String]
      required :mail_from, String, api_name: :mailFrom

      # @!attribute rcpt_to
      #   Envelope recipient addresses
      #
      #   @return [Array<String>]
      required :rcpt_to, ArkEmail::Internal::Type::ArrayOf[String], api_name: :rcptTo

      # @!attribute bounce
      #   Whether this is a bounce message (accepts null)
      #
      #   @return [Boolean, nil]
      optional :bounce, ArkEmail::Internal::Type::Boolean, nil?: true

      # @!method initialize(data:, mail_from:, rcpt_to:, bounce: nil, request_options: {})
      #   @param data [String] Base64-encoded RFC 2822 message
      #
      #   @param mail_from [String] Envelope sender address
      #
      #   @param rcpt_to [Array<String>] Envelope recipient addresses
      #
      #   @param bounce [Boolean, nil] Whether this is a bounce message (accepts null)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
