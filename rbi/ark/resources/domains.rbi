# typed: strong

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
      sig do
        params(
          name: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::DomainResponse)
      end
      def create(
        # Domain name (e.g., "mail.example.com")
        name:,
        request_options: {}
      )
      end

      # Get detailed information about a domain including DNS record status
      sig do
        params(
          domain_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::DomainResponse)
      end
      def retrieve(
        # Domain ID or domain name
        domain_id,
        request_options: {}
      )
      end

      # Get all sending domains with their verification status
      sig do
        params(request_options: Ark::RequestOptions::OrHash).returns(
          Ark::Models::DomainListResponse
        )
      end
      def list(request_options: {})
      end

      # Remove a sending domain. You will no longer be able to send emails from this
      # domain.
      #
      # **Warning:** This action cannot be undone.
      sig do
        params(
          domain_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::SuccessResponse)
      end
      def delete(domain_id, request_options: {})
      end

      # Check if DNS records are correctly configured and verify the domain. Returns the
      # current status of each required DNS record.
      #
      # Call this after you've added the DNS records shown when creating the domain.
      sig do
        params(
          domain_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::DomainResponse)
      end
      def verify(domain_id, request_options: {})
      end

      # @api private
      sig { params(client: Ark::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
