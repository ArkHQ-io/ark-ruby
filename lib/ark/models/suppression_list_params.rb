# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#list
    class SuppressionListParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

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
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
