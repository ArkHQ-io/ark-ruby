# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Suppressions#retrieve
      class SuppressionRetrieveResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::SuppressionRetrieveResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::SuppressionRetrieveResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::SuppressionRetrieveResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::SuppressionRetrieveResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute address
          #   The email address that was checked
          #
          #   @return [String]
          required :address, String

          # @!attribute suppressed
          #   Whether the address is currently suppressed
          #
          #   @return [Boolean]
          required :suppressed, ArkEmail::Internal::Type::Boolean

          # @!attribute created_at
          #   When the suppression was created (if suppressed)
          #
          #   @return [Time, nil]
          optional :created_at, Time, api_name: :createdAt, nil?: true

          # @!attribute reason
          #   Reason for suppression (if suppressed)
          #
          #   @return [String, nil]
          optional :reason, String, nil?: true

          # @!method initialize(address:, suppressed:, created_at: nil, reason: nil)
          #   @param address [String] The email address that was checked
          #
          #   @param suppressed [Boolean] Whether the address is currently suppressed
          #
          #   @param created_at [Time, nil] When the suppression was created (if suppressed)
          #
          #   @param reason [String, nil] Reason for suppression (if suppressed)
        end
      end
    end
  end
end
