# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#update
      class CredentialUpdateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute hold
        #   Set to `true` to disable the credential (put on hold). Set to `false` to enable
        #   the credential (release from hold).
        #
        #   @return [Boolean, nil]
        optional :hold, ArkEmail::Internal::Type::Boolean

        # @!attribute name
        #   New name for the credential
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(tenant_id:, hold: nil, name: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::Tenants::CredentialUpdateParams} for more details.
        #
        #   @param tenant_id [String]
        #
        #   @param hold [Boolean] Set to `true` to disable the credential (put on hold).
        #
        #   @param name [String] New name for the credential
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
