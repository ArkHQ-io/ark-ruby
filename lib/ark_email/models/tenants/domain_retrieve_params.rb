# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Domains#retrieve
      class DomainRetrieveParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute domain_id
        #
        #   @return [String]
        required :domain_id, String

        # @!method initialize(tenant_id:, domain_id:, request_options: {})
        #   @param tenant_id [String]
        #   @param domain_id [String]
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
