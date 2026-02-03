# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#delete
      class CredentialDeleteResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::CredentialDeleteResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::CredentialDeleteResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::CredentialDeleteResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::CredentialDeleteResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute deleted
          #
          #   @return [Boolean, true]
          required :deleted, const: true

          # @!method initialize(deleted: true)
          #   @param deleted [Boolean, true]
        end
      end
    end
  end
end
