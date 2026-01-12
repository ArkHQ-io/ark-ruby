# frozen_string_literal: true

module Ark
  module Resources
    class Domains
      # Add a new domain for sending emails. Returns DNS records that must be configured
      # before the domain can be verified.
      #
      # **Required DNS records:**
      #
      # - **SPF** - TXT record for sender authentication
      # - **DKIM** - TXT record for email signing
      # - **Return Path** - CNAME for bounce handling
      #
      # After adding DNS records, call `POST /domains/{id}/verify` to verify.
      #
      # @overload create(name:, request_options: {})
      #
      # @param name [String] Domain name (e.g., "mail.example.com")
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::DomainResponse]
      #
      # @see Ark::Models::DomainCreateParams
      def create(params)
        parsed, options = Ark::DomainCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "domains",
          body: parsed,
          model: Ark::DomainResponse,
          options: options
        )
      end

      # Get detailed information about a domain including DNS record status
      #
      # @overload retrieve(domain_id, request_options: {})
      #
      # @param domain_id [String] Domain ID or domain name
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::DomainResponse]
      #
      # @see Ark::Models::DomainRetrieveParams
      def retrieve(domain_id, params = {})
        @client.request(
          method: :get,
          path: ["domains/%1$s", domain_id],
          model: Ark::DomainResponse,
          options: params[:request_options]
        )
      end

      # Get all sending domains with their verification status
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::DomainListResponse]
      #
      # @see Ark::Models::DomainListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "domains",
          model: Ark::Models::DomainListResponse,
          options: params[:request_options]
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
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::SuccessResponse]
      #
      # @see Ark::Models::DomainDeleteParams
      def delete(domain_id, params = {})
        @client.request(
          method: :delete,
          path: ["domains/%1$s", domain_id],
          model: Ark::SuccessResponse,
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
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::DomainResponse]
      #
      # @see Ark::Models::DomainVerifyParams
      def verify(domain_id, params = {})
        @client.request(
          method: :post,
          path: ["domains/%1$s/verify", domain_id],
          model: Ark::DomainResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Ark::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
