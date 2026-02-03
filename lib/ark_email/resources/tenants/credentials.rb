# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      class Credentials
        # Some parameter documentations has been truncated, see
        # {ArkEmail::Models::Tenants::CredentialCreateParams} for more details.
        #
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
        #
        # @overload create(tenant_id, name:, type:, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param name [String] Name for the credential. Can only contain letters, numbers,
        #
        # @param type [Symbol, ArkEmail::Models::Tenants::CredentialCreateParams::Type] Type of credential:
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::CredentialCreateResponse]
        #
        # @see ArkEmail::Models::Tenants::CredentialCreateParams
        def create(tenant_id, params)
          parsed, options = ArkEmail::Tenants::CredentialCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["tenants/%1$s/credentials", tenant_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::CredentialCreateResponse,
            options: options
          )
        end

        # Get details of a specific credential.
        #
        # **Revealing the key:** By default, the credential key is not returned. Pass
        # `reveal=true` to include the key in the response. Use this sparingly and only
        # when you need to retrieve the key (e.g., for configuration).
        #
        # @overload retrieve(credential_id, tenant_id:, reveal: nil, request_options: {})
        #
        # @param credential_id [Integer] Path param: The credential ID (numeric)
        #
        # @param tenant_id [String] Path param: The tenant ID
        #
        # @param reveal [Boolean] Query param: Set to `true` to include the credential key in the response
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::CredentialRetrieveResponse]
        #
        # @see ArkEmail::Models::Tenants::CredentialRetrieveParams
        def retrieve(credential_id, params)
          parsed, options = ArkEmail::Tenants::CredentialRetrieveParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/credentials/%2$s", tenant_id, credential_id],
            query: parsed,
            model: ArkEmail::Models::Tenants::CredentialRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {ArkEmail::Models::Tenants::CredentialUpdateParams} for more details.
        #
        # Update a credential's name or hold status.
        #
        # **Hold Status:**
        #
        # - When `hold: true`, the credential is disabled and cannot be used to send
        #   emails.
        # - When `hold: false`, the credential is active and can send emails.
        # - Use this to temporarily disable a credential without deleting it.
        #
        # @overload update(credential_id, tenant_id:, hold: nil, name: nil, request_options: {})
        #
        # @param credential_id [Integer] Path param: The credential ID (numeric)
        #
        # @param tenant_id [String] Path param: The tenant ID
        #
        # @param hold [Boolean] Body param: Set to `true` to disable the credential (put on hold).
        #
        # @param name [String] Body param: New name for the credential
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::CredentialUpdateResponse]
        #
        # @see ArkEmail::Models::Tenants::CredentialUpdateParams
        def update(credential_id, params)
          parsed, options = ArkEmail::Tenants::CredentialUpdateParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["tenants/%1$s/credentials/%2$s", tenant_id, credential_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::CredentialUpdateResponse,
            options: options
          )
        end

        # List all SMTP and API credentials for a tenant. Credentials are used to send
        # emails through Postal on behalf of the tenant.
        #
        # **Security:** Credential keys are not returned in the list response. Use the
        # retrieve endpoint with `reveal=true` to get the key.
        #
        # @overload list(tenant_id, page: nil, per_page: nil, type: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param page [Integer] Page number (1-indexed)
        #
        # @param per_page [Integer] Number of items per page (max 100)
        #
        # @param type [Symbol, ArkEmail::Models::Tenants::CredentialListParams::Type] Filter by credential type
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::Tenants::CredentialListResponse>]
        #
        # @see ArkEmail::Models::Tenants::CredentialListParams
        def list(tenant_id, params = {})
          parsed, options = ArkEmail::Tenants::CredentialListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["tenants/%1$s/credentials", tenant_id],
            query: parsed.transform_keys(per_page: "perPage"),
            page: ArkEmail::Internal::PageNumberPagination,
            model: ArkEmail::Models::Tenants::CredentialListResponse,
            options: options
          )
        end

        # Permanently delete (revoke) a credential. The credential can no longer be used
        # to send emails.
        #
        # **Warning:** This action is irreversible. If you want to temporarily disable a
        # credential, use the update endpoint to set `hold: true` instead.
        #
        # @overload delete(credential_id, tenant_id:, request_options: {})
        #
        # @param credential_id [Integer] The credential ID (numeric)
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::CredentialDeleteResponse]
        #
        # @see ArkEmail::Models::Tenants::CredentialDeleteParams
        def delete(credential_id, params)
          parsed, options = ArkEmail::Tenants::CredentialDeleteParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["tenants/%1$s/credentials/%2$s", tenant_id, credential_id],
            model: ArkEmail::Models::Tenants::CredentialDeleteResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [ArkEmail::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
