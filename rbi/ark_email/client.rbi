# typed: strong

module ArkEmail
  class Client < ArkEmail::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Use your API key from
    # [arkhq.io/org/credentials](https://arkhq.io/org/credentials)
    #
    # ```
    # Authorization: Bearer YOUR_API_KEY
    # ```
    sig { returns(String) }
    attr_reader :api_key

    # Send and manage email messages.
    #
    # **Quick Reference:**
    #
    # - `POST /emails` - Send a single email
    # - `POST /emails/batch` - Send up to 100 emails
    # - `GET /emails/{emailId}` - Get email status and details
    # - `GET /emails` - List sent emails
    # - `POST /emails/{emailId}/retry` - Retry failed delivery
    sig { returns(ArkEmail::Resources::Emails) }
    attr_reader :emails

    # Access API request logs for debugging and monitoring.
    #
    # Every API request is logged with details including:
    #
    # - Request method, path, and endpoint
    # - Response status code and duration
    # - Error details (code, message) for failed requests
    # - SDK information (name, version)
    # - Rate limit state at time of request
    # - Request and response bodies (for single log retrieval)
    #
    # **Retention:** Logs are retained for 90 days.
    #
    # **Body storage:** Request and response bodies are stored encrypted and truncated
    # at 25KB. Bodies are only returned when retrieving a single log entry.
    #
    # **Quick Reference:**
    #
    # - `GET /logs` - List API request logs with filters
    # - `GET /logs/{requestId}` - Get full details including request/response bodies
    sig { returns(ArkEmail::Resources::Logs) }
    attr_reader :logs

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
    sig { returns(ArkEmail::Resources::Usage) }
    attr_reader :usage

    # Check account rate limits and send limits.
    #
    # The limits endpoint returns current status for operational limits:
    #
    # - **Rate limit:** API requests per second (currently 10/sec)
    # - **Send limit:** Emails per hour (default 100/hour for new accounts)
    # - **Billing:** Credit balance and auto-recharge configuration
    #
    # **AI Integration Note:** This endpoint is designed for AI agents and MCP servers
    # to understand account constraints before taking actions. Call this endpoint
    # first when planning batch operations to avoid hitting limits unexpectedly.
    #
    # **Quick Reference:**
    #
    # - `GET /limits` - Get current rate limits and send limits
    # - `GET /usage` - (Deprecated) Use `/limits` instead
    sig { returns(ArkEmail::Resources::Limits) }
    attr_reader :limits

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
    sig { returns(ArkEmail::Resources::Tenants) }
    attr_reader :tenants

    sig { returns(ArkEmail::Resources::Platform) }
    attr_reader :platform

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Use your API key from
      # [arkhq.io/org/credentials](https://arkhq.io/org/credentials)
      #
      # ````
      # Authorization: Bearer YOUR_API_KEY
      # ``` Defaults to `ENV["ARK_API_KEY"]`
      # ````
      api_key: ENV["ARK_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["ARK_BASE_URL"]`
      base_url: ENV["ARK_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: ArkEmail::Client::DEFAULT_MAX_RETRIES,
      timeout: ArkEmail::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: ArkEmail::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: ArkEmail::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
