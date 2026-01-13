# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#retrieve
    class EmailRetrieveParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

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
      #   {ArkEmail::Models::EmailRetrieveParams} for more details.
      #
      #   @param expand [String] Comma-separated list of fields to include:
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
