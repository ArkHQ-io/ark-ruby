# typed: strong

module ArkEmail
  module Resources
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
      # - `sendLimit` may be null if Postal is temporarily unavailable
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
