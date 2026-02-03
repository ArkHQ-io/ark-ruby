# typed: strong

module ArkEmail
  module Resources
    class Tenants
      class Credentials
        # Create a new SMTP or API credential for a tenant. The credential can be used to
        # send emails through Postal on behalf of the tenant.
        #
        # **Important:** The credential key is only returned once at creation time. Store
        # it securely - you cannot retrieve it again.
        #
        # **Credential Types:**
        #
        # - `smtp` - For SMTP-based email sending. Returns both `key` and `smtpUsername`.
        # - `api` - For API-based email sending. Returns only `key`.
        sig do
          params(
            tenant_id: String,
            name: String,
            type: ArkEmail::Tenants::CredentialCreateParams::Type::OrSymbol,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::CredentialCreateResponse)
        end
        def create(
          # The tenant ID
          tenant_id,
          # Name for the credential. Can only contain letters, numbers, hyphens, and
          # underscores. Max 50 characters.
          name:,
          # Type of credential:
          #
          # - `smtp` - For SMTP-based email sending
          # - `api` - For API-based email sending
          type:,
          request_options: {}
        )
        end

        # Get details of a specific credential.
        #
        # **Revealing the key:** By default, the credential key is not returned. Pass
        # `reveal=true` to include the key in the response. Use this sparingly and only
        # when you need to retrieve the key (e.g., for configuration).
        sig do
          params(
            credential_id: Integer,
            tenant_id: String,
            reveal: T::Boolean,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::CredentialRetrieveResponse)
        end
        def retrieve(
          # Path param: The credential ID (numeric)
          credential_id,
          # Path param: The tenant ID
          tenant_id:,
          # Query param: Set to `true` to include the credential key in the response
          reveal: nil,
          request_options: {}
        )
        end

        # Update a credential's name or hold status.
        #
        # **Hold Status:**
        #
        # - When `hold: true`, the credential is disabled and cannot be used to send
        #   emails.
        # - When `hold: false`, the credential is active and can send emails.
        # - Use this to temporarily disable a credential without deleting it.
        sig do
          params(
            credential_id: Integer,
            tenant_id: String,
            hold: T::Boolean,
            name: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::CredentialUpdateResponse)
        end
        def update(
          # Path param: The credential ID (numeric)
          credential_id,
          # Path param: The tenant ID
          tenant_id:,
          # Body param: Set to `true` to disable the credential (put on hold). Set to
          # `false` to enable the credential (release from hold).
          hold: nil,
          # Body param: New name for the credential
          name: nil,
          request_options: {}
        )
        end

        # List all SMTP and API credentials for a tenant. Credentials are used to send
        # emails through Postal on behalf of the tenant.
        #
        # **Security:** Credential keys are not returned in the list response. Use the
        # retrieve endpoint with `reveal=true` to get the key.
        sig do
          params(
            tenant_id: String,
            page: Integer,
            per_page: Integer,
            type: ArkEmail::Tenants::CredentialListParams::Type::OrSymbol,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(
            ArkEmail::Internal::PageNumberPagination[
              ArkEmail::Models::Tenants::CredentialListResponse
            ]
          )
        end
        def list(
          # The tenant ID
          tenant_id,
          # Page number (1-indexed)
          page: nil,
          # Number of items per page (max 100)
          per_page: nil,
          # Filter by credential type
          type: nil,
          request_options: {}
        )
        end

        # Permanently delete (revoke) a credential. The credential can no longer be used
        # to send emails.
        #
        # **Warning:** This action is irreversible. If you want to temporarily disable a
        # credential, use the update endpoint to set `hold: true` instead.
        sig do
          params(
            credential_id: Integer,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::CredentialDeleteResponse)
        end
        def delete(
          # The credential ID (numeric)
          credential_id,
          # The tenant ID
          tenant_id:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ArkEmail::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
