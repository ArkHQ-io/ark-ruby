# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#retry_
    class EmailRetryParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute email_id
      #
      #   @return [String]
      required :email_id, String

      # @!method initialize(email_id:, request_options: {})
      #   @param email_id [String]
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
