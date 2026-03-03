# frozen_string_literal: true

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
      # @return [ArkEmail::Resources::Tenants::Credentials]
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
      # @return [ArkEmail::Resources::Tenants::Domains]
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
      # @return [ArkEmail::Resources::Tenants::Suppressions]
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
      # @return [ArkEmail::Resources::Tenants::Webhooks]
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
      # @return [ArkEmail::Resources::Tenants::Tracking]
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
      # @return [ArkEmail::Resources::Tenants::Usage]
      attr_reader :usage

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::TenantCreateParams} for more details.
      #
      # Create a new tenant.
      #
      # Returns the created tenant with a unique `id`. Store this ID in your database to
      # reference this tenant later.
      #
      # @overload create(name:, metadata: nil, request_options: {})
      #
      # @param name [String] Display name for the tenant (e.g., your customer's company name)
      #
      # @param metadata [Hash{Symbol=>String, Float, Boolean, nil}, nil] Custom key-value pairs. Useful for storing references to your internal systems.
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantCreateResponse]
      #
      # @see ArkEmail::Models::TenantCreateParams
      def create(params)
        parsed, options = ArkEmail::TenantCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "tenants",
          body: parsed,
          model: ArkEmail::Models::TenantCreateResponse,
          options: options
        )
      end

      # Get a tenant by ID.
      #
      # @overload retrieve(tenant_id, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantRetrieveResponse]
      #
      # @see ArkEmail::Models::TenantRetrieveParams
      def retrieve(tenant_id, params = {})
        @client.request(
          method: :get,
          path: ["tenants/%1$s", tenant_id],
          model: ArkEmail::Models::TenantRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::TenantUpdateParams} for more details.
      #
      # Update a tenant's name, metadata, or status. At least one field is required.
      #
      # Metadata is replaced entirely—include all keys you want to keep.
      #
      # @overload update(tenant_id, metadata: nil, name: nil, status: nil, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param metadata [Hash{Symbol=>String, Float, Boolean, nil}, nil] Custom key-value pairs. Useful for storing references to your internal systems.
      #
      # @param name [String] Display name for the tenant
      #
      # @param status [Symbol, ArkEmail::Models::TenantUpdateParams::Status] Tenant status
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantUpdateResponse]
      #
      # @see ArkEmail::Models::TenantUpdateParams
      def update(tenant_id, params = {})
        parsed, options = ArkEmail::TenantUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["tenants/%1$s", tenant_id],
          body: parsed,
          model: ArkEmail::Models::TenantUpdateResponse,
          options: options
        )
      end

      # List all tenants with pagination. Filter by `status` if needed.
      #
      # @overload list(page: nil, per_page: nil, status: nil, request_options: {})
      #
      # @param page [Integer] Page number (1-indexed)
      #
      # @param per_page [Integer] Number of items per page (max 100)
      #
      # @param status [Symbol, ArkEmail::Models::TenantListParams::Status] Filter by tenant status
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::Tenant>]
      #
      # @see ArkEmail::Models::TenantListParams
      def list(params = {})
        parsed, options = ArkEmail::TenantListParams.dump_request(params)
        query = ArkEmail::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "tenants",
          query: query.transform_keys(per_page: "perPage"),
          page: ArkEmail::Internal::PageNumberPagination,
          model: ArkEmail::Tenant,
          options: options
        )
      end

      # Permanently delete a tenant. This cannot be undone.
      #
      # @overload delete(tenant_id, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantDeleteResponse]
      #
      # @see ArkEmail::Models::TenantDeleteParams
      def delete(tenant_id, params = {})
        @client.request(
          method: :delete,
          path: ["tenants/%1$s", tenant_id],
          model: ArkEmail::Models::TenantDeleteResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ArkEmail::Client]
      def initialize(client:)
        @client = client
        @credentials = ArkEmail::Resources::Tenants::Credentials.new(client: client)
        @domains = ArkEmail::Resources::Tenants::Domains.new(client: client)
        @suppressions = ArkEmail::Resources::Tenants::Suppressions.new(client: client)
        @webhooks = ArkEmail::Resources::Tenants::Webhooks.new(client: client)
        @tracking = ArkEmail::Resources::Tenants::Tracking.new(client: client)
        @usage = ArkEmail::Resources::Tenants::Usage.new(client: client)
      end
    end
  end
end
