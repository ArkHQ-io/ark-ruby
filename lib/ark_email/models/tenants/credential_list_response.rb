# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#list
      class CredentialListResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the credential
        #
        #   @return [Integer]
        required :id, Integer

        # @!attribute created_at
        #   When the credential was created
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute hold
        #   Whether the credential is on hold (disabled). When `true`, the credential cannot
        #   be used to send emails.
        #
        #   @return [Boolean]
        required :hold, ArkEmail::Internal::Type::Boolean

        # @!attribute last_used_at
        #   When the credential was last used to send an email
        #
        #   @return [Time, nil]
        required :last_used_at, Time, api_name: :lastUsedAt, nil?: true

        # @!attribute name
        #   Name of the credential
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #   Type of credential:
        #
        #   - `smtp` - For SMTP-based email sending
        #   - `api` - For API-based email sending
        #
        #   @return [Symbol, ArkEmail::Models::Tenants::CredentialListResponse::Type]
        required :type, enum: -> { ArkEmail::Models::Tenants::CredentialListResponse::Type }

        # @!attribute updated_at
        #   When the credential was last updated
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, created_at:, hold:, last_used_at:, name:, type:, updated_at:)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::Tenants::CredentialListResponse} for more details.
        #
        #   @param id [Integer] Unique identifier for the credential
        #
        #   @param created_at [Time] When the credential was created
        #
        #   @param hold [Boolean] Whether the credential is on hold (disabled).
        #
        #   @param last_used_at [Time, nil] When the credential was last used to send an email
        #
        #   @param name [String] Name of the credential
        #
        #   @param type [Symbol, ArkEmail::Models::Tenants::CredentialListResponse::Type] Type of credential:
        #
        #   @param updated_at [Time] When the credential was last updated

        # Type of credential:
        #
        # - `smtp` - For SMTP-based email sending
        # - `api` - For API-based email sending
        #
        # @see ArkEmail::Models::Tenants::CredentialListResponse#type
        module Type
          extend ArkEmail::Internal::Type::Enum

          SMTP = :smtp
          API = :api

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
