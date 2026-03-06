# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#create
      class CredentialCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute name
        #   Name for the credential. Can only contain letters, numbers, hyphens, and
        #   underscores. Max 50 characters.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #   Type of credential:
        #
        #   - `smtp` - For SMTP-based email sending
        #   - `api` - For API-based email sending
        #
        #   @return [Symbol, ArkEmail::Models::Tenants::CredentialCreateParams::Type]
        required :type, enum: -> { ArkEmail::Tenants::CredentialCreateParams::Type }

        # @!method initialize(tenant_id:, name:, type:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::Tenants::CredentialCreateParams} for more details.
        #
        #   @param tenant_id [String]
        #
        #   @param name [String] Name for the credential. Can only contain letters, numbers,
        #
        #   @param type [Symbol, ArkEmail::Models::Tenants::CredentialCreateParams::Type] Type of credential:
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

        # Type of credential:
        #
        # - `smtp` - For SMTP-based email sending
        # - `api` - For API-based email sending
        module Type
          extend ArkEmail::Internal::Type::Enum

          SMTP = :smtp
          API = :api

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
