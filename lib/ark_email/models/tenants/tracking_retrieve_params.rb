# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Tracking#retrieve
      class TrackingRetrieveParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute tracking_id
        #
        #   @return [String]
        required :tracking_id, String

        # @!method initialize(tenant_id:, tracking_id:, request_options: {})
        #   @param tenant_id [String]
        #   @param tracking_id [String]
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
