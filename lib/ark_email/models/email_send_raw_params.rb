# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_raw
    class EmailSendRawParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute from
      #   Sender email address
      #
      #   @return [String]
      required :from, String

      # @!attribute raw_message
      #   Base64-encoded RFC 2822 MIME message
      #
      #   @return [String]
      required :raw_message, String, api_name: :rawMessage

      # @!attribute to
      #   Recipient email addresses
      #
      #   @return [Array<String>]
      required :to, ArkEmail::Internal::Type::ArrayOf[String]

      # @!attribute bounce
      #   Whether this is a bounce message (accepts null)
      #
      #   @return [Boolean, nil]
      optional :bounce, ArkEmail::Internal::Type::Boolean, nil?: true

      # @!method initialize(from:, raw_message:, to:, bounce: nil, request_options: {})
      #   @param from [String] Sender email address
      #
      #   @param raw_message [String] Base64-encoded RFC 2822 MIME message
      #
      #   @param to [Array<String>] Recipient email addresses
      #
      #   @param bounce [Boolean, nil] Whether this is a bounce message (accepts null)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
