# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#send_raw
    class EmailSendRawParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

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
      required :rcpt_to, Ark::Internal::Type::ArrayOf[String], api_name: :rcptTo

      # @!method initialize(data:, mail_from:, rcpt_to:, request_options: {})
      #   @param data [String] Base64-encoded RFC 2822 message
      #
      #   @param mail_from [String] Envelope sender address
      #
      #   @param rcpt_to [Array<String>] Envelope recipient addresses
      #
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
