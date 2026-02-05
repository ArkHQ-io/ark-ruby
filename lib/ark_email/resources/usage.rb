# frozen_string_literal: true

module ArkEmail
  module Resources
    class Usage
      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::UsageRetrieveParams} for more details.
      #
      # Returns aggregated email sending statistics for your entire organization. For
      # per-tenant breakdown, use `GET /usage/tenants`.
      #
      # **Use cases:**
      #
      # - Platform dashboards showing org-wide metrics
      # - Quick health check on overall sending
      # - Monitoring total volume and delivery rates
      #
      # **Response includes:**
      #
      # - `emails` - Aggregated email counts across all tenants
      # - `rates` - Overall delivery and bounce rates
      # - `tenants` - Tenant count summary (total, active, with activity)
      #
      # **Related endpoints:**
      #
      # - `GET /usage/tenants` - Paginated usage per tenant
      # - `GET /usage/export` - Export usage data for billing
      # - `GET /tenants/{tenantId}/usage` - Single tenant usage details
      # - `GET /limits` - Rate limits and send limits
      #
      # @overload retrieve(period: nil, timezone: nil, request_options: {})
      #
      # @param period [String] Time period for usage data.
      #
      # @param timezone [String] Timezone for period calculations (IANA format)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::OrgUsageSummary]
      #
      # @see ArkEmail::Models::UsageRetrieveParams
      def retrieve(params = {})
        parsed, options = ArkEmail::UsageRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: "usage",
          query: parsed,
          model: ArkEmail::OrgUsageSummary,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::UsageExportParams} for more details.
      #
      # Export email usage data for all tenants in CSV or JSON Lines format. Designed
      # for billing system integration, data warehousing, and analytics.
      #
      # **Jobs to be done:**
      #
      # - Import usage data into billing systems (Stripe, Chargebee, etc.)
      # - Load into data warehouses (Snowflake, BigQuery, etc.)
      # - Process in spreadsheets (Excel, Google Sheets)
      # - Feed into BI tools (Looker, Metabase, etc.)
      #
      # **Export formats:**
      #
      # - `csv` - UTF-8 with BOM for Excel compatibility (default)
      # - `jsonl` - JSON Lines (one JSON object per line, streamable)
      #
      # **CSV columns:** `tenant_id`, `tenant_name`, `external_id`, `status`, `sent`,
      # `delivered`, `soft_failed`, `hard_failed`, `bounced`, `held`, `delivery_rate`,
      # `bounce_rate`, `period_start`, `period_end`
      #
      # **Response headers:**
      #
      # - `Content-Disposition` - Filename for download
      # - `Content-Type` - `text/csv` or `application/x-ndjson`
      #
      # @overload export(format_: nil, min_sent: nil, period: nil, status: nil, timezone: nil, request_options: {})
      #
      # @param format_ [Symbol, ArkEmail::Models::UsageExportParams::Format] Export format
      #
      # @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      # @param period [String] Time period for export.
      #
      # @param status [Symbol, ArkEmail::Models::UsageExportParams::Status] Filter by tenant status
      #
      # @param timezone [String] Timezone for period calculations (IANA format)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<ArkEmail::Models::UsageExportResponseItem>]
      #
      # @see ArkEmail::Models::UsageExportParams
      def export(params = {})
        parsed, options = ArkEmail::UsageExportParams.dump_request(params)
        @client.request(
          method: :get,
          path: "usage/export",
          query: parsed.transform_keys(format_: "format", min_sent: "minSent"),
          model: ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::UsageExportResponseItem],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::UsageListTenantsParams} for more details.
      #
      # Returns email usage statistics for all tenants in your organization. Results are
      # paginated with page-based navigation.
      #
      # **Jobs to be done:**
      #
      # - Generate monthly billing invoices per tenant
      # - Build admin dashboards showing all customer usage
      # - Identify high-volume or problematic tenants
      # - Track usage against plan limits
      #
      # **Sorting options:**
      #
      # - `sent`, `-sent` - Sort by emails sent (ascending/descending)
      # - `delivered`, `-delivered` - Sort by emails delivered
      # - `bounce_rate`, `-bounce_rate` - Sort by bounce rate
      # - `tenant_name`, `-tenant_name` - Sort alphabetically by tenant name
      #
      # **Filtering:**
      #
      # - `status` - Filter by tenant status (active, suspended, archived)
      # - `minSent` - Only include tenants with at least N emails sent
      #
      # **Auto-pagination:** SDKs support iterating over all pages automatically.
      #
      # @overload list_tenants(min_sent: nil, page: nil, period: nil, per_page: nil, sort: nil, status: nil, timezone: nil, request_options: {})
      #
      # @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      # @param page [Integer] Page number (1-indexed)
      #
      # @param period [String] Time period for usage data. Defaults to current month.
      #
      # @param per_page [Integer] Results per page (max 100)
      #
      # @param sort [Symbol, ArkEmail::Models::UsageListTenantsParams::Sort] Sort order for results. Prefix with `-` for descending order.
      #
      # @param status [Symbol, ArkEmail::Models::UsageListTenantsParams::Status] Filter by tenant status
      #
      # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::TenantUsageItem>]
      #
      # @see ArkEmail::Models::UsageListTenantsParams
      def list_tenants(params = {})
        parsed, options = ArkEmail::UsageListTenantsParams.dump_request(params)
        @client.request(
          method: :get,
          path: "usage/tenants",
          query: parsed.transform_keys(min_sent: "minSent", per_page: "perPage"),
          page: ArkEmail::Internal::PageNumberPagination,
          model: ArkEmail::TenantUsageItem,
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
