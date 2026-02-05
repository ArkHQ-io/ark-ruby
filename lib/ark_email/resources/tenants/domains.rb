# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      class Domains
        # Add a new sending domain to a tenant. Returns DNS records that must be
        # configured before the domain can be verified.
        #
        # Each tenant gets their own isolated mail server for domain isolation.
        #
        # **Required DNS records:**
        #
        # - **SPF** - TXT record for sender authentication
        # - **DKIM** - TXT record for email signing
        # - **Return Path** - CNAME for bounce handling
        #
        # After adding DNS records, call
        # `POST /tenants/{tenantId}/domains/{domainId}/verify` to verify.
        #
        # @overload create(tenant_id, name:, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param name [String] Domain name (e.g., "mail.example.com")
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::DomainCreateResponse]
        #
        # @see ArkEmail::Models::Tenants::DomainCreateParams
        def create(tenant_id, params)
          parsed, options = ArkEmail::Tenants::DomainCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["tenants/%1$s/domains", tenant_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::DomainCreateResponse,
            options: options
          )
        end

        # Get detailed information about a domain including DNS record status.
        #
        # @overload retrieve(domain_id, tenant_id:, request_options: {})
        #
        # @param domain_id [String] Domain ID or domain name
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::DomainRetrieveResponse]
        #
        # @see ArkEmail::Models::Tenants::DomainRetrieveParams
        def retrieve(domain_id, params)
          parsed, options = ArkEmail::Tenants::DomainRetrieveParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/domains/%2$s", tenant_id, domain_id],
            model: ArkEmail::Models::Tenants::DomainRetrieveResponse,
            options: options
          )
        end

        # Get all sending domains for a specific tenant with their verification status.
        #
        # @overload list(tenant_id, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::DomainListResponse]
        #
        # @see ArkEmail::Models::Tenants::DomainListParams
        def list(tenant_id, params = {})
          @client.request(
            method: :get,
            path: ["tenants/%1$s/domains", tenant_id],
            model: ArkEmail::Models::Tenants::DomainListResponse,
            options: params[:request_options]
          )
        end

        # Remove a sending domain from a tenant. You will no longer be able to send emails
        # from this domain.
        #
        # **Warning:** This action cannot be undone.
        #
        # @overload delete(domain_id, tenant_id:, request_options: {})
        #
        # @param domain_id [String] Domain ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::DomainDeleteResponse]
        #
        # @see ArkEmail::Models::Tenants::DomainDeleteParams
        def delete(domain_id, params)
          parsed, options = ArkEmail::Tenants::DomainDeleteParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["tenants/%1$s/domains/%2$s", tenant_id, domain_id],
            model: ArkEmail::Models::Tenants::DomainDeleteResponse,
            options: options
          )
        end

        # Check if DNS records are correctly configured and verify the domain. Returns the
        # current status of each required DNS record.
        #
        # Call this after you've added the DNS records shown when creating the domain.
        #
        # @overload verify(domain_id, tenant_id:, request_options: {})
        #
        # @param domain_id [String] Domain ID
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::DomainVerifyResponse]
        #
        # @see ArkEmail::Models::Tenants::DomainVerifyParams
        def verify(domain_id, params)
          parsed, options = ArkEmail::Tenants::DomainVerifyParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["tenants/%1$s/domains/%2$s/verify", tenant_id, domain_id],
            model: ArkEmail::Models::Tenants::DomainVerifyResponse,
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
