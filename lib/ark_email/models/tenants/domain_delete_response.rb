# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Domains#delete
      class DomainDeleteResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::DomainDeleteResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::DomainDeleteResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::DomainDeleteResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::DomainDeleteResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!method initialize(message:)
          #   @param message [String]
        end
      end
    end
  end
end
