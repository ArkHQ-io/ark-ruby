# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tenants#list
    class TenantListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute page
      #   Page number (1-indexed)
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute per_page
      #   Number of items per page (max 100)
      #
      #   @return [Integer, nil]
      optional :per_page, Integer

      # @!attribute status
      #   Filter by tenant status
      #
      #   @return [Symbol, ArkEmail::Models::TenantListParams::Status, nil]
      optional :status, enum: -> { ArkEmail::TenantListParams::Status }

      # @!method initialize(page: nil, per_page: nil, status: nil, request_options: {})
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param per_page [Integer] Number of items per page (max 100)
      #
      #   @param status [Symbol, ArkEmail::Models::TenantListParams::Status] Filter by tenant status
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Filter by tenant status
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
