# typed: strong

module ArkEmail
  module Resources
    class Usage
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
      sig do
        params(request_options: ArkEmail::RequestOptions::OrHash).returns(
          ArkEmail::Models::UsageRetrieveResponse
        )
      end
      def retrieve(request_options: {})
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
      sig do
        params(
          format_: ArkEmail::UsageExportParams::Format::OrSymbol,
          min_sent: Integer,
          period: String,
          status: ArkEmail::UsageExportParams::Status::OrSymbol,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T::Array[ArkEmail::Models::UsageExportResponseItem])
      end
      def export(
        # Export format
        format_: nil,
        # Only include tenants with at least this many emails sent
        min_sent: nil,
        # Time period for export. Defaults to current month.
        period: nil,
        # Filter by tenant status
        status: nil,
        # Timezone for period calculations (IANA format). Defaults to UTC.
        timezone: nil,
        request_options: {}
      )
      end

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
      sig do
        params(
          limit: Integer,
          min_sent: Integer,
          offset: Integer,
          period: String,
          sort: ArkEmail::UsageListByTenantParams::Sort::OrSymbol,
          status: ArkEmail::UsageListByTenantParams::Status::OrSymbol,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(
          ArkEmail::Internal::OffsetPagination[
            ArkEmail::BulkTenantUsage::Tenant
          ]
        )
      end
      def list_by_tenant(
        # Maximum number of tenants to return (1-100)
        limit: nil,
        # Only include tenants with at least this many emails sent
        min_sent: nil,
        # Number of tenants to skip for pagination
        offset: nil,
        # Time period for usage data. Defaults to current month.
        period: nil,
        # Sort order for results. Prefix with `-` for descending order.
        sort: nil,
        # Filter by tenant status
        status: nil,
        # Timezone for period calculations (IANA format). Defaults to UTC.
        timezone: nil,
        request_options: {}
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
      sig do
        params(
          tenant_id: String,
          granularity:
            ArkEmail::UsageRetrieveTenantTimeseriesParams::Granularity::OrSymbol,
          period: String,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::UsageRetrieveTenantTimeseriesResponse)
      end
      def retrieve_tenant_timeseries(
        # The tenant ID
        tenant_id,
        # Time bucket size for data points
        granularity: nil,
        # Time period for timeseries data. Defaults to current month.
        period: nil,
        # Timezone for period calculations (IANA format). Defaults to UTC.
        timezone: nil,
        request_options: {}
      )
      end

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
      sig do
        params(
          tenant_id: String,
          period: String,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::UsageRetrieveTenantUsageResponse)
      end
      def retrieve_tenant_usage(
        # The tenant ID
        tenant_id,
        # Time period for usage data. Defaults to current month.
        #
        # **Formats:**
        #
        # - Shortcuts: `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
        #   `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
        # - Month: `2024-01`
        # - Range: `2024-01-01..2024-01-31`
        # - Day: `2024-01-15`
        period: nil,
        # Timezone for period calculations (IANA format). Defaults to UTC.
        timezone: nil,
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
