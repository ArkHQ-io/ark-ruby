# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#list
      class CredentialListParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute page
        #   Page number (1-indexed)
        #
        #   @return [Integer, nil]
        optional :page, Integer

        # @!attribute per_page
        #   Number of items per page (max 100)
        #
        #   @return [Integer, nil]
        optional :per_page, Integer

        # @!attribute type
        #   Filter by credential type
        #
        #   @return [Symbol, ArkEmail::Models::Tenants::CredentialListParams::Type, nil]
        optional :type, enum: -> { ArkEmail::Tenants::CredentialListParams::Type }

        # @!method initialize(page: nil, per_page: nil, type: nil, request_options: {})
        #   @param page [Integer] Page number (1-indexed)
        #
        #   @param per_page [Integer] Number of items per page (max 100)
        #
        #   @param type [Symbol, ArkEmail::Models::Tenants::CredentialListParams::Type] Filter by credential type
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

        # Filter by credential type
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
