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

      # @!attribute tenant_id
      #   ID of the tenant this domain belongs to
      #
      #   @return [String]
      required :tenant_id, String

      # @!method initialize(name:, tenant_id:, request_options: {})
      #   @param name [String] Domain name (e.g., "mail.example.com")
      #
      #   @param tenant_id [String] ID of the tenant this domain belongs to
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
