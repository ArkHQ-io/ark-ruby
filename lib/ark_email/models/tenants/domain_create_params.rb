# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Domains#create
      class DomainCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute name
        #   Domain name (e.g., "mail.example.com")
        #
        #   @return [String]
        required :name, String

        # @!method initialize(tenant_id:, name:, request_options: {})
        #   @param tenant_id [String]
        #
        #   @param name [String] Domain name (e.g., "mail.example.com")
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
