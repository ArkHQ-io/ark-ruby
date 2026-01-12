# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#retrieve
    class EmailRetrieveParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute expand
      #   Comma-separated list of fields to include:
      #
      #   - `content` - HTML and plain text body
      #   - `headers` - Email headers
      #   - `deliveries` - Delivery attempt history
      #   - `activity` - Opens and clicks
      #
      #   @return [String, nil]
      optional :expand, String

      # @!method initialize(expand: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Ark::Models::EmailRetrieveParams} for more details.
      #
      #   @param expand [String] Comma-separated list of fields to include:
      #
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
