# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      class Usage
        # Some parameter documentations has been truncated, see
        # {ArkEmail::Models::Tenants::UsageRetrieveParams} for more details.
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
        # @overload retrieve(tenant_id, period: nil, timezone: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param period [String] Time period for usage data. Defaults to current month.
        #
        # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::UsageRetrieveResponse]
        #
        # @see ArkEmail::Models::Tenants::UsageRetrieveParams
        def retrieve(tenant_id, params = {})
          parsed, options = ArkEmail::Tenants::UsageRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["tenants/%1$s/usage", tenant_id],
            query: parsed,
            model: ArkEmail::Models::Tenants::UsageRetrieveResponse,
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
        # @overload retrieve_timeseries(tenant_id, granularity: nil, period: nil, timezone: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param granularity [Symbol, ArkEmail::Models::Tenants::UsageRetrieveTimeseriesParams::Granularity] Time bucket size for data points
        #
        # @param period [String] Time period for timeseries data. Defaults to current month.
        #
        # @param timezone [String] Timezone for period calculations (IANA format). Defaults to UTC.
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::UsageRetrieveTimeseriesResponse]
        #
        # @see ArkEmail::Models::Tenants::UsageRetrieveTimeseriesParams
        def retrieve_timeseries(tenant_id, params = {})
          parsed, options = ArkEmail::Tenants::UsageRetrieveTimeseriesParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["tenants/%1$s/usage/timeseries", tenant_id],
            query: parsed,
            model: ArkEmail::Models::Tenants::UsageRetrieveTimeseriesResponse,
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
end
