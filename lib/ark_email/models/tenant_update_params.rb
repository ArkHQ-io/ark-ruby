# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tenants#update
    class TenantUpdateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

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
                 ArkEmail::Internal::Type::HashOf[union: ArkEmail::TenantUpdateParams::Metadata, nil?: true]
               },
               nil?: true

      # @!attribute name
      #   Display name for the tenant
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute status
      #   Tenant status
      #
      #   @return [Symbol, ArkEmail::Models::TenantUpdateParams::Status, nil]
      optional :status, enum: -> { ArkEmail::TenantUpdateParams::Status }

      # @!method initialize(metadata: nil, name: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::TenantUpdateParams} for more details.
      #
      #   @param metadata [Hash{Symbol=>String, Float, Boolean, nil}, nil] Custom key-value pairs. Useful for storing references to your internal systems.
      #
      #   @param name [String] Display name for the tenant
      #
      #   @param status [Symbol, ArkEmail::Models::TenantUpdateParams::Status] Tenant status
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

      # Tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        ACTIVE = :active
        SUSPENDED = :suspended
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
