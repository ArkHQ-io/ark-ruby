# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Suppressions#delete
    class SuppressionDeleteParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
