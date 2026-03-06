# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#delete
      class CredentialDeleteParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute credential_id
        #
        #   @return [Integer]
        required :credential_id, Integer

        # @!method initialize(tenant_id:, credential_id:, request_options: {})
        #   @param tenant_id [String]
        #   @param credential_id [Integer]
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
