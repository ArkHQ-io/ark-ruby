# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Domains#list
    class DomainListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute tenant_id
      #   Filter domains by tenant ID
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(tenant_id: nil, request_options: {})
      #   @param tenant_id [String] Filter domains by tenant ID
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
