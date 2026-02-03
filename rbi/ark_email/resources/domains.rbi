# typed: strong

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
      sig do
        params(
          name: String,
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::DomainCreateResponse)
      end
      def create(
        # Domain name (e.g., "mail.example.com")
        name:,
        # ID of the tenant this domain belongs to
        tenant_id:,
        request_options: {}
      )
      end

      # Get detailed information about a domain including DNS record status
      sig do
        params(
          domain_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::DomainRetrieveResponse)
      end
      def retrieve(
        # Domain ID or domain name
        domain_id,
        request_options: {}
      )
      end

      # Get all sending domains with their verification status.
      #
      # Optionally filter by `tenant_id` to list domains for a specific tenant. When
      # filtered, response includes `tenant_id` and `tenant_name` for each domain.
      sig do
        params(
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::DomainListResponse)
      end
      def list(
        # Filter domains by tenant ID
        tenant_id: nil,
        request_options: {}
      )
      end

      # Remove a sending domain. You will no longer be able to send emails from this
      # domain.
      #
      # **Warning:** This action cannot be undone.
      sig do
        params(
          domain_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::DomainDeleteResponse)
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
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::DomainVerifyResponse)
      end
      def verify(domain_id, request_options: {})
      end

      # @api private
      sig { params(client: ArkEmail::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
