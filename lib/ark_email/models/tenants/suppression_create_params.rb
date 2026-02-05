# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Suppressions#create
      class SuppressionCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute address
        #   Email address to suppress
        #
        #   @return [String]
        required :address, String

        # @!attribute reason
        #   Reason for suppression (accepts null)
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!method initialize(address:, reason: nil, request_options: {})
        #   @param address [String] Email address to suppress
        #
        #   @param reason [String, nil] Reason for suppression (accepts null)
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
