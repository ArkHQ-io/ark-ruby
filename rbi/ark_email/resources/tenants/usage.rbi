# typed: strong

module ArkEmail
  module Resources
    class Tenants
      class Usage
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
          ).returns(ArkEmail::Models::Tenants::UsageRetrieveResponse)
        end
        def retrieve(
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
              ArkEmail::Tenants::UsageRetrieveTimeseriesParams::Granularity::OrSymbol,
            period: String,
            timezone: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::UsageRetrieveTimeseriesResponse)
        end
        def retrieve_timeseries(
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

        # @api private
        sig { params(client: ArkEmail::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
