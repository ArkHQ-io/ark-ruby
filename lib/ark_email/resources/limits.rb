# frozen_string_literal: true

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
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::LimitRetrieveResponse]
      #
      # @see ArkEmail::Models::LimitRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "limits",
          model: ArkEmail::Models::LimitRetrieveResponse,
          options: params[:request_options]
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
