# typed: strong

module ArkEmail
  module Resources
    class Usage
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
      sig do
        params(
          period: String,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::OrgUsageSummary)
      end
      def retrieve(
        # Time period for usage data.
        #
        # **Shortcuts:** `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
        # `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
        #
        # **Month format:** `2024-01` (YYYY-MM)
        #
        # **Custom range:** `2024-01-01..2024-01-15`
        period: nil,
        # Timezone for period calculations (IANA format)
        timezone: nil,
        request_options: {}
      )
      end

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
        # Time period for export.
        #
        # **Shortcuts:** `this_month`, `last_month`, `last_30_days`, etc.
        #
        # **Month format:** `2024-01` (YYYY-MM)
        #
        # **Custom range:** `2024-01-01..2024-01-15`
        period: nil,
        # Filter by tenant status
        status: nil,
        # Timezone for period calculations (IANA format)
        timezone: nil,
        request_options: {}
      )
      end

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
      sig do
        params(
          min_sent: Integer,
          page: Integer,
          period: String,
          per_page: Integer,
          sort: ArkEmail::UsageListTenantsParams::Sort::OrSymbol,
          status: ArkEmail::UsageListTenantsParams::Status::OrSymbol,
          timezone: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(
          ArkEmail::Internal::PageNumberPagination[ArkEmail::TenantUsageItem]
        )
      end
      def list_tenants(
        # Only include tenants with at least this many emails sent
        min_sent: nil,
        # Page number (1-indexed)
        page: nil,
        # Time period for usage data. Defaults to current month.
        #
        # **Shortcuts:** `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
        # `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
        #
        # **Month format:** `2024-01` (YYYY-MM)
        #
        # **Custom range:** `2024-01-01..2024-01-15`
        period: nil,
        # Results per page (max 100)
        per_page: nil,
        # Sort order for results. Prefix with `-` for descending order.
        sort: nil,
        # Filter by tenant status
        status: nil,
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
