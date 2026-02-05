# typed: strong

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
        sig do
          params(
            tenant_id: String,
            name: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::DomainCreateResponse)
        end
        def create(
          # The tenant ID
          tenant_id,
          # Domain name (e.g., "mail.example.com")
          name:,
          request_options: {}
        )
        end

        # Get detailed information about a domain including DNS record status.
        sig do
          params(
            domain_id: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::DomainRetrieveResponse)
        end
        def retrieve(
          # Domain ID or domain name
          domain_id,
          # The tenant ID
          tenant_id:,
          request_options: {}
        )
        end

        # Get all sending domains for a specific tenant with their verification status.
        sig do
          params(
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::DomainListResponse)
        end
        def list(
          # The tenant ID
          tenant_id,
          request_options: {}
        )
        end

        # Remove a sending domain from a tenant. You will no longer be able to send emails
        # from this domain.
        #
        # **Warning:** This action cannot be undone.
        sig do
          params(
            domain_id: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::DomainDeleteResponse)
        end
        def delete(
          # Domain ID
          domain_id,
          # The tenant ID
          tenant_id:,
          request_options: {}
        )
        end

        # Check if DNS records are correctly configured and verify the domain. Returns the
        # current status of each required DNS record.
        #
        # Call this after you've added the DNS records shown when creating the domain.
        sig do
          params(
            domain_id: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::DomainVerifyResponse)
        end
        def verify(
          # Domain ID
          domain_id,
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
