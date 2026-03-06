# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Suppressions#list
      class SuppressionListParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute page
        #
        #   @return [Integer, nil]
        optional :page, Integer

        # @!attribute per_page
        #
        #   @return [Integer, nil]
        optional :per_page, Integer

        # @!method initialize(tenant_id:, page: nil, per_page: nil, request_options: {})
        #   @param tenant_id [String]
        #   @param page [Integer]
        #   @param per_page [Integer]
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
