# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Suppressions#create
      class SuppressionCreateResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::SuppressionCreateResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::SuppressionCreateResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::SuppressionCreateResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::SuppressionCreateResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Suppression ID
          #
          #   @return [String]
          required :id, String

          # @!attribute address
          #
          #   @return [String]
          required :address, String

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute reason
          #   Reason for suppression
          #
          #   @return [String, nil]
          optional :reason, String

          # @!method initialize(id:, address:, created_at:, reason: nil)
          #   @param id [String] Suppression ID
          #
          #   @param address [String]
          #
          #   @param created_at [Time]
          #
          #   @param reason [String] Reason for suppression
        end
      end
    end
  end
end
