# typed: strong

module ArkEmail
  module Resources
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
    class Limits
      # Returns current rate limit and send limit information for your account.
      #
      # This endpoint is the recommended way to check your account's operational limits.
      # Use `/usage` endpoints for historical usage analytics.
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
      # - `sendLimit` may be null if the service is temporarily unavailable
      # - `billing` is null if billing is not configured
      # - Send limit resets at the top of each hour
      sig do
        params(request_options: ArkEmail::RequestOptions::OrHash).returns(
          ArkEmail::Models::LimitRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: ArkEmail::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
