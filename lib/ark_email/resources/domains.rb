# frozen_string_literal: true

module ArkEmail
  module Resources
    class Domains
      # Add a new domain for sending emails. Returns DNS records that must be configured
      # before the domain can be verified.
      #
      # **Required:** `tenant_id` to specify which tenant the domain belongs to. Each
      # tenant gets their own isolated mail server for domain isolation.
      #
      # **Required DNS records:**
      #
      # - **SPF** - TXT record for sender authentication
      # - **DKIM** - TXT record for email signing
      # - **Return Path** - CNAME for bounce handling
      #
      # After adding DNS records, call `POST /domains/{id}/verify` to verify.
      #
      # @overload create(name:, tenant_id:, request_options: {})
      #
      # @param name [String] Domain name (e.g., "mail.example.com")
      #
      # @param tenant_id [String] ID of the tenant this domain belongs to
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::DomainCreateResponse]
      #
      # @see ArkEmail::Models::DomainCreateParams
      def create(params)
        parsed, options = ArkEmail::DomainCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "domains",
          body: parsed,
          model: ArkEmail::Models::DomainCreateResponse,
          options: options
        )
      end

      # Get detailed information about a domain including DNS record status
      #
      # @overload retrieve(domain_id, request_options: {})
      #
      # @param domain_id [String] Domain ID or domain name
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::DomainRetrieveResponse]
      #
      # @see ArkEmail::Models::DomainRetrieveParams
      def retrieve(domain_id, params = {})
        @client.request(
          method: :get,
          path: ["domains/%1$s", domain_id],
          model: ArkEmail::Models::DomainRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Get all sending domains with their verification status.
      #
      # Optionally filter by `tenant_id` to list domains for a specific tenant. When
      # filtered, response includes `tenant_id` and `tenant_name` for each domain.
      #
      # @overload list(tenant_id: nil, request_options: {})
      #
      # @param tenant_id [String] Filter domains by tenant ID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::DomainListResponse]
      #
      # @see ArkEmail::Models::DomainListParams
      def list(params = {})
        parsed, options = ArkEmail::DomainListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "domains",
          query: parsed,
          model: ArkEmail::Models::DomainListResponse,
          options: options
        )
      end

      # Remove a sending domain. You will no longer be able to send emails from this
      # domain.
      #
      # **Warning:** This action cannot be undone.
      #
      # @overload delete(domain_id, request_options: {})
      #
      # @param domain_id [String]
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::DomainDeleteResponse]
      #
      # @see ArkEmail::Models::DomainDeleteParams
      def delete(domain_id, params = {})
        @client.request(
          method: :delete,
          path: ["domains/%1$s", domain_id],
          model: ArkEmail::Models::DomainDeleteResponse,
          options: params[:request_options]
        )
      end

      # Check if DNS records are correctly configured and verify the domain. Returns the
      # current status of each required DNS record.
      #
      # Call this after you've added the DNS records shown when creating the domain.
      #
      # @overload verify(domain_id, request_options: {})
      #
      # @param domain_id [String]
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::DomainVerifyResponse]
      #
      # @see ArkEmail::Models::DomainVerifyParams
      def verify(domain_id, params = {})
        @client.request(
          method: :post,
          path: ["domains/%1$s/verify", domain_id],
          model: ArkEmail::Models::DomainVerifyResponse,
          options: params[:request_options]
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
