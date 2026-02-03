# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tenants#create
    class TenantCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute name
      #   Display name for the tenant (e.g., your customer's company name)
      #
      #   @return [String]
      required :name, String

      # @!attribute metadata
      #   Custom key-value pairs. Useful for storing references to your internal systems.
      #
      #   **Limits:**
      #
      #   - Max 50 keys
      #   - Key names max 40 characters
      #   - String values max 500 characters
      #   - Total size max 8KB
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, nil}, nil]
      optional :metadata,
               -> {
                 ArkEmail::Internal::Type::HashOf[union: ArkEmail::TenantCreateParams::Metadata, nil?: true]
               },
               nil?: true

      # @!method initialize(name:, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::TenantCreateParams} for more details.
      #
      #   @param name [String] Display name for the tenant (e.g., your customer's company name)
      #
      #   @param metadata [Hash{Symbol=>String, Float, Boolean, nil}, nil] Custom key-value pairs. Useful for storing references to your internal systems.
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      module Metadata
        extend ArkEmail::Internal::Type::Union

        variant String

        variant Float

        variant ArkEmail::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Float, Boolean)]
      end
    end
  end
end
