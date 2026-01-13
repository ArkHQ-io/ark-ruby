# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Suppressions#list
    class SuppressionListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute page
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute per_page
      #
      #   @return [Integer, nil]
      optional :per_page, Integer

      # @!method initialize(page: nil, per_page: nil, request_options: {})
      #   @param page [Integer]
      #   @param per_page [Integer]
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
