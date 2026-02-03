# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Credentials#retrieve
      class CredentialRetrieveResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::CredentialRetrieveResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
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
          #   @return [Symbol, ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type]
          required :type, enum: -> { ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type }

          # @!attribute updated_at
          #   When the credential was last updated
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute key
          #   The credential key (secret). Only included when:
          #
          #   - Creating a new credential (always returned)
          #   - Retrieving with `reveal=true`
          #
          #   @return [String, nil]
          optional :key, String

          # @!attribute smtp_username
          #   SMTP username for authentication. Only included for SMTP credentials when the
          #   key is revealed.
          #
          #   @return [String, nil]
          optional :smtp_username, String, api_name: :smtpUsername

          # @!method initialize(id:, created_at:, hold:, last_used_at:, name:, type:, updated_at:, key: nil, smtp_username: nil)
          #   Some parameter documentations has been truncated, see
          #   {ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data} for more details.
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
          #   @param type [Symbol, ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type] Type of credential:
          #
          #   @param updated_at [Time] When the credential was last updated
          #
          #   @param key [String] The credential key (secret). Only included when:
          #
          #   @param smtp_username [String] SMTP username for authentication. Only included for SMTP credentials

          # Type of credential:
          #
          # - `smtp` - For SMTP-based email sending
          # - `api` - For API-based email sending
          #
          # @see ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data#type
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
end
