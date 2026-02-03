# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tenants#list
    class Tenant < ArkEmail::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the tenant
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When the tenant was created
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute metadata
      #   Custom key-value pairs for storing additional data
      #
      #   @return [Hash{Symbol=>String, Float, Boolean, nil}]
      required :metadata, -> { ArkEmail::Internal::Type::HashOf[union: ArkEmail::Tenant::Metadata, nil?: true] }

      # @!attribute name
      #   Display name for the tenant
      #
      #   @return [String]
      required :name, String

      # @!attribute status
      #   Current status of the tenant:
      #
      #   - `active` - Normal operation
      #   - `suspended` - Temporarily disabled
      #   - `archived` - Soft-deleted
      #
      #   @return [Symbol, ArkEmail::Models::Tenant::Status]
      required :status, enum: -> { ArkEmail::Tenant::Status }

      # @!attribute updated_at
      #   When the tenant was last updated
      #
      #   @return [Time]
      required :updated_at, Time

      # @!method initialize(id:, created_at:, metadata:, name:, status:, updated_at:)
      #   Some parameter documentations has been truncated, see {ArkEmail::Models::Tenant}
      #   for more details.
      #
      #   @param id [String] Unique identifier for the tenant
      #
      #   @param created_at [Time] When the tenant was created
      #
      #   @param metadata [Hash{Symbol=>String, Float, Boolean, nil}] Custom key-value pairs for storing additional data
      #
      #   @param name [String] Display name for the tenant
      #
      #   @param status [Symbol, ArkEmail::Models::Tenant::Status] Current status of the tenant:
      #
      #   @param updated_at [Time] When the tenant was last updated

      module Metadata
        extend ArkEmail::Internal::Type::Union

        variant String

        variant Float

        variant ArkEmail::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Float, Boolean)]
      end

      # Current status of the tenant:
      #
      # - `active` - Normal operation
      # - `suspended` - Temporarily disabled
      # - `archived` - Soft-deleted
      #
      # @see ArkEmail::Models::Tenant#status
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
