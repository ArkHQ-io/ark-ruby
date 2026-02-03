# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Tenants#delete
    class TenantDeleteResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::TenantDeleteResponse::Data]
      required :data, -> { ArkEmail::Models::TenantDeleteResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::TenantDeleteResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::TenantDeleteResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute deleted
        #
        #   @return [Boolean, true]
        required :deleted, const: true

        # @!method initialize(deleted: true)
        #   @param deleted [Boolean, true]
      end
    end
  end
end
