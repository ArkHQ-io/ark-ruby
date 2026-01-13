# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Domains#create
    class DomainCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute name
      #   Domain name (e.g., "mail.example.com")
      #
      #   @return [String]
      required :name, String

      # @!method initialize(name:, request_options: {})
      #   @param name [String] Domain name (e.g., "mail.example.com")
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
