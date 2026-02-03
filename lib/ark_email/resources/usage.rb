# frozen_string_literal: true

module ArkEmail
  module Resources
    class Usage
      # @deprecated
      #
      # > **Deprecated:** Use `GET /limits` instead for rate limits and send limits.
      # > This endpoint will be removed in a future version.
      #
      # Returns current usage and limit information for your account.
      #
      # This endpoint is designed for:
      #
      # - **AI agents/MCP servers:** Check constraints before planning batch operations
      # - **Monitoring dashboards:** Display current usage status
      # - **Rate limit awareness:** Know remaining capacity before making requests
      #
      # **Response includes:**
      #
      # - `rateLimit` - API request rate limit (requests per second)
      # - `sendLimit` - Email sending limit (emails per hour)
      # - `billing` - Credit balance and auto-recharge configuration
      #
      # **Notes:**
      #
      # - This request counts against your rate limit
      # - `sendLimit` may be null if Postal is temporarily unavailable
      # - `billing` is null if billing is not configured
      # - Send limit resets at the top of each hour
      #
      # **Migration:**
      #
      # - For rate limits and send limits, use `GET /limits`
      # - For per-tenant usage analytics, use `GET /tenants/{tenantId}/usage`
      # - For bulk tenant usage, use `GET /usage/by-tenant`
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::UsageRetrieveResponse]
      #
      # @see ArkEmail::Models::UsageRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "usage",
          model: ArkEmail::Models::UsageRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Export usage data for all tenants in a format suitable for billing systems.
      #
      # **Use cases:**
      #
      # - Import into billing systems (Stripe, Chargebee, etc.)
      # - Generate invoices
      # - Archive usage data
      #
      # **Export formats:**
      #
      # - `csv` - Comma-separated values (default)
      # - `jsonl` - JSON Lines (one JSON object per line)
      # - `json` - JSON array
      #
      # **Response headers:**
      #
      # - `X-Total-Tenants` - Total number of tenants in export
      # - `X-Total-Sent` - Total emails sent across all tenants
      # - `Content-Disposition` - Suggested filename for download
      #
      # This endpoint returns up to 10,000 tenants per request. For organizations with
      # more tenants, use the `/usage/by-tenant` endpoint with pagination.
      #
      # @overload export(format_: nil, min_sent: nil, period: nil, status: nil, timezone: nil, request_options: {})
      #
      # @param format_ [Symbol, ArkEmail::Models::UsageExportParams::Format] Export format
      #
      # @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      # @param period [String] Time period for export. Defaults to current month.
      #
      # @param status [Symbol, ArkEmail::Models::UsageExportParams::Status] Filter by tenant status
      #
      # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
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
          query: parsed.transform_keys(format_: "format"),
          model: ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::UsageExportResponseItem],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::UsageListByTenantParams} for more details.
      #
      # Returns email usage statistics for all tenants in your organization.
      #
      # **Use cases:**
      #
      # - Generate monthly billing reports
      # - Build admin dashboards showing all customer usage
      # - Identify high-volume or problematic tenants
      #
      # **Sorting options:**
      #
      # - `sent`, `-sent` - Sort by emails sent (ascending/descending)
      # - `delivered`, `-delivered` - Sort by emails delivered
      # - `bounce_rate`, `-bounce_rate` - Sort by bounce rate
      # - `name`, `-name` - Sort alphabetically by tenant name
      #
      # **Filtering:**
      #
      # - `status` - Filter by tenant status (active, suspended, archived)
      # - `min_sent` - Only include tenants with at least N emails sent
      #
      # Results are paginated. Use `limit` and `offset` for pagination.
      #
      # @overload list_by_tenant(limit: nil, min_sent: nil, offset: nil, period: nil, sort: nil, status: nil, timezone: nil, request_options: {})
      #
      # @param limit [Integer] Maximum number of tenants to return (1-100)
      #
      # @param min_sent [Integer] Only include tenants with at least this many emails sent
      #
      # @param offset [Integer] Number of tenants to skip for pagination
      #
      # @param period [String] Time period for usage data. Defaults to current month.
      #
      # @param sort [Symbol, ArkEmail::Models::UsageListByTenantParams::Sort] Sort order for results. Prefix with `-` for descending order.
      #
      # @param status [Symbol, ArkEmail::Models::UsageListByTenantParams::Status] Filter by tenant status
      #
      # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Internal::OffsetPagination<ArkEmail::Models::BulkTenantUsage::Tenant>]
      #
      # @see ArkEmail::Models::UsageListByTenantParams
      def list_by_tenant(params = {})
        parsed, options = ArkEmail::UsageListByTenantParams.dump_request(params)
        @client.request(
          method: :get,
          path: "usage/by-tenant",
          query: parsed,
          page: ArkEmail::Internal::OffsetPagination,
          model: ArkEmail::BulkTenantUsage::Tenant,
          options: options
        )
      end

      # Returns time-bucketed email statistics for a specific tenant.
      #
      # **Use cases:**
      #
      # - Build usage charts and graphs
      # - Identify sending patterns
      # - Detect anomalies in delivery rates
      #
      # **Granularity options:**
      #
      # - `hour` - Hourly buckets (best for last 7 days)
      # - `day` - Daily buckets (best for last 30-90 days)
      # - `week` - Weekly buckets (best for last 6 months)
      # - `month` - Monthly buckets (best for year-over-year)
      #
      # The response includes a data point for each time bucket with all email metrics.
      #
      # @overload retrieve_tenant_timeseries(tenant_id, granularity: nil, period: nil, timezone: nil, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param granularity [Symbol, ArkEmail::Models::UsageRetrieveTenantTimeseriesParams::Granularity] Time bucket size for data points
      #
      # @param period [String] Time period for timeseries data. Defaults to current month.
      #
      # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::UsageRetrieveTenantTimeseriesResponse]
      #
      # @see ArkEmail::Models::UsageRetrieveTenantTimeseriesParams
      def retrieve_tenant_timeseries(tenant_id, params = {})
        parsed, options = ArkEmail::UsageRetrieveTenantTimeseriesParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["tenants/%1$s/usage/timeseries", tenant_id],
          query: parsed,
          model: ArkEmail::Models::UsageRetrieveTenantTimeseriesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::UsageRetrieveTenantUsageParams} for more details.
      #
      # Returns email sending statistics for a specific tenant over a time period.
      #
      # **Use cases:**
      #
      # - Display usage dashboard to your customers
      # - Calculate per-tenant billing
      # - Monitor tenant health and delivery rates
      #
      # **Period formats:**
      #
      # - Shortcuts: `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
      #   `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
      # - Month: `2024-01` (full month)
      # - Date range: `2024-01-01..2024-01-31`
      # - Single day: `2024-01-15`
      #
      # **Response includes:**
      #
      # - `emails` - Counts for sent, delivered, soft_failed, hard_failed, bounced, held
      # - `rates` - Delivery rate and bounce rate as decimals (0.95 = 95%)
      #
      # @overload retrieve_tenant_usage(tenant_id, period: nil, timezone: nil, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param period [String] Time period for usage data. Defaults to current month.
      #
      # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::UsageRetrieveTenantUsageResponse]
      #
      # @see ArkEmail::Models::UsageRetrieveTenantUsageParams
      def retrieve_tenant_usage(tenant_id, params = {})
        parsed, options = ArkEmail::UsageRetrieveTenantUsageParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["tenants/%1$s/usage", tenant_id],
          query: parsed,
          model: ArkEmail::Models::UsageRetrieveTenantUsageResponse,
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
