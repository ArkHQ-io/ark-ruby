# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#retry_
    class EmailRetryResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::EmailRetryResponse::Data]
      required :data, -> { ArkEmail::Models::EmailRetryResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::EmailRetryResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::EmailRetryResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Email identifier (token)
        #
        #   @return [String]
        required :id, String

        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!attribute tenant_id
        #   The tenant ID this email belongs to
        #
        #   @return [String]
        required :tenant_id, String, api_name: :tenantId

        # @!method initialize(id:, message:, tenant_id:)
        #   @param id [String] Email identifier (token)
        #
        #   @param message [String]
        #
        #   @param tenant_id [String] The tenant ID this email belongs to
      end
    end
  end
end
