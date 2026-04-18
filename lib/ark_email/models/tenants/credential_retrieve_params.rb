# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#retrieve
      class CredentialRetrieveParams < ArkEmail::Internal::Type::BaseModel
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

        # @!attribute reveal
        #   Set to `true` to include the credential key in the response
        #
        #   @return [Boolean, nil]
        optional :reveal, ArkEmail::Internal::Type::Boolean

        # @!method initialize(tenant_id:, credential_id:, reveal: nil, request_options: {})
        #   @param tenant_id [String]
        #
        #   @param credential_id [Integer]
        #
        #   @param reveal [Boolean] Set to `true` to include the credential key in the response
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
