# typed: strong

module ArkEmail
  module Resources
    # Manage tenants (your customers).
    #
    # Create a tenant for each of your customers to track their email sending
    # separately. Store the tenant `id` in your database and use `metadata` for any
    # custom data.
    #
    # **Quick Reference:**
    #
    # - `POST /tenants` - Create a new tenant
    # - `GET /tenants` - List all tenants (paginated)
    # - `GET /tenants/{id}` - Get tenant details
    # - `PATCH /tenants/{id}` - Update tenant name, metadata, or status
    # - `DELETE /tenants/{id}` - Delete a tenant
    class Tenants
      sig { returns(ArkEmail::Resources::Tenants::Credentials) }
      attr_reader :credentials

      # Manage sending domains.
      #
      # Before you can send emails, you need to:
      #
      # 1. Add a domain
      # 2. Configure DNS records (SPF, DKIM, Return Path)
      # 3. Verify the domain
      #
      # **Quick Reference:**
      #
      # - `POST /domains` - Add a new domain
      # - `GET /domains` - List all domains
      # - `POST /domains/{id}/verify` - Check DNS and verify domain
      # - `DELETE /domains/{id}` - Remove a domain
      sig { returns(ArkEmail::Resources::Tenants::Domains) }
      attr_reader :domains

      # Manage the suppression list.
      #
      # Suppressed email addresses will not receive any emails. Addresses are
      # automatically suppressed when they hard bounce or file spam complaints.
      #
      # **Quick Reference:**
      #
      # - `GET /suppressions` - List suppressed addresses
      # - `POST /suppressions` - Add to suppression list
      # - `DELETE /suppressions/{email}` - Remove from suppression list
      # - `GET /suppressions/{email}` - Check if address is suppressed
      sig { returns(ArkEmail::Resources::Tenants::Suppressions) }
      attr_reader :suppressions

      # Configure webhook endpoints for real-time notifications.
      #
      # Webhooks notify your application when email events occur:
      #
      # - Email delivered, bounced, or failed
      # - Email opened or link clicked
      # - Spam complaint received
      #
      # **Quick Reference:**
      #
      # - `POST /webhooks` - Create a webhook endpoint
      # - `GET /webhooks` - List all webhooks
      # - `POST /webhooks/{id}/test` - Test a webhook with sample data
      # - `PATCH /webhooks/{id}` - Update webhook configuration
      # - `DELETE /webhooks/{id}` - Remove a webhook
      # - `GET /webhooks/{id}/deliveries` - List delivery attempts
      # - `GET /webhooks/{id}/deliveries/{deliveryId}` - Get delivery details
      # - `POST /webhooks/{id}/deliveries/{deliveryId}/replay` - Replay a delivery
      #
      # ## Webhook Signatures
      #
      # All webhooks are cryptographically signed using RSA-SHA256 for security. Each
      # webhook request includes:
      #
      # | Header                | Description                                             |
      # | --------------------- | ------------------------------------------------------- |
      # | `X-Ark-Signature`     | Base64-encoded RSA-SHA256 signature of the request body |
      # | `X-Ark-Signature-KID` | Key ID identifying which public key was used            |
      #
      # Verify signatures by fetching the public key from:
      #
      # ```
      # GET https://mail.arkhq.io/.well-known/jwks.json
      # ```
      #
      # ```javascript
      # const crypto = require("crypto");
      #
      # async function verifyWebhook(payload, signatureBase64, publicKey) {
      #   const signature = Buffer.from(signatureBase64, "base64");
      #   const verifier = crypto.createVerify("RSA-SHA256");
      #   verifier.update(payload);
      #   return verifier.verify(publicKey, signature);
      # }
      #
      # // In your webhook handler:
      # const isValid = await verifyWebhook(
      #   rawBody,
      #   req.headers["x-ark-signature"],
      #   cachedPublicKey
      # );
      # ```
      #
      # **Important:** Always verify signatures before processing webhook data. See the
      # [Webhook Integration Guide](/guides/webhook-integration) for complete examples.
      sig { returns(ArkEmail::Resources::Tenants::Webhooks) }
      attr_reader :webhooks

      # Manage track domains for open and click tracking.
      #
      # Track domains enable you to track when recipients:
      #
      # - Open your emails (tracking pixel)
      # - Click links in your emails
      #
      # **Setup Process:**
      #
      # 1. Create a track domain with `POST /tracking`
      # 2. Add the CNAME record to your DNS
      # 3. Verify DNS with `POST /tracking/{id}/verify`
      # 4. Track domain is ready when `dnsOk` is true
      #
      # **Quick Reference:**
      #
      # - `POST /tracking` - Create a new track domain
      # - `GET /tracking` - List all track domains
      # - `GET /tracking/{id}` - Get track domain details
      # - `POST /tracking/{id}/verify` - Verify DNS configuration
      # - `PATCH /tracking/{id}` - Enable/disable tracking features
      # - `DELETE /tracking/{id}` - Remove a track domain
      sig { returns(ArkEmail::Resources::Tenants::Tracking) }
      attr_reader :tracking

      # Per-tenant usage analytics and bulk reporting.
      #
      # Track email sending statistics for each tenant to power billing, dashboards, and
      # monitoring.
      #
      # **Single Tenant Usage:**
      #
      # - `GET /tenants/{id}/usage` - Get usage stats for a specific tenant
      # - `GET /tenants/{id}/usage/timeseries` - Get time-bucketed data for charts
      #
      # **Bulk Usage:**
      #
      # - `GET /usage/tenants` - Get usage for all tenants (paginated, sortable)
      # - `GET /usage/export` - Export usage data as CSV, JSONL, or JSON
      #
      # **Period Formats:**
      #
      # - Shortcuts: `today`, `yesterday`, `this_month`, `last_month`, `last_7_days`,
      #   `last_30_days`
      # - Month: `2024-01`
      # - Date range: `2024-01-01..2024-01-15`
      sig { returns(ArkEmail::Resources::Tenants::Usage) }
      attr_reader :usage

      # Create a new tenant.
      #
      # Returns the created tenant with a unique `id`. Store this ID in your database to
      # reference this tenant later.
      sig do
        params(
          name: String,
          metadata:
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(ArkEmail::TenantCreateParams::Metadata::Variants)
              ]
            ),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantCreateResponse)
      end
      def create(
        # Display name for the tenant (e.g., your customer's company name)
        name:,
        # Custom key-value pairs. Useful for storing references to your internal systems.
        #
        # **Limits:**
        #
        # - Max 50 keys
        # - Key names max 40 characters
        # - String values max 500 characters
        # - Total size max 8KB
        metadata: nil,
        request_options: {}
      )
      end

      # Get a tenant by ID.
      sig do
        params(
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantRetrieveResponse)
      end
      def retrieve(
        # The tenant ID
        tenant_id,
        request_options: {}
      )
      end

      # Update a tenant's name, metadata, or status. At least one field is required.
      #
      # Metadata is replaced entirely—include all keys you want to keep.
      sig do
        params(
          tenant_id: String,
          metadata:
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(ArkEmail::TenantUpdateParams::Metadata::Variants)
              ]
            ),
          name: String,
          status: ArkEmail::TenantUpdateParams::Status::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantUpdateResponse)
      end
      def update(
        # The tenant ID
        tenant_id,
        # Custom key-value pairs. Useful for storing references to your internal systems.
        #
        # **Limits:**
        #
        # - Max 50 keys
        # - Key names max 40 characters
        # - String values max 500 characters
        # - Total size max 8KB
        metadata: nil,
        # Display name for the tenant
        name: nil,
        # Tenant status
        status: nil,
        request_options: {}
      )
      end

      # List all tenants with pagination. Filter by `status` if needed.
      sig do
        params(
          page: Integer,
          per_page: Integer,
          status: ArkEmail::TenantListParams::Status::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Internal::PageNumberPagination[ArkEmail::Tenant])
      end
      def list(
        # Page number (1-indexed)
        page: nil,
        # Number of items per page (max 100)
        per_page: nil,
        # Filter by tenant status
        status: nil,
        request_options: {}
      )
      end

      # Permanently delete a tenant. This cannot be undone.
      sig do
        params(
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantDeleteResponse)
      end
      def delete(
        # The tenant ID
        tenant_id,
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
