# frozen_string_literal: true

module ArkEmail
  module Resources
    class Logs
      # Retrieve detailed information about a specific API request log, including the
      # full request and response bodies.
      #
      # **Body decryption:** Request and response bodies are stored encrypted and
      # automatically decrypted when retrieved. Bodies larger than 25KB are truncated at
      # storage time with a `... [truncated]` marker.
      #
      # **Use cases:**
      #
      # - Debug a specific failed request
      # - Review the exact payload sent/received
      # - Share request details with support
      #
      # **Related endpoints:**
      #
      # - `GET /logs` - List logs with filters
      #
      # @overload retrieve(request_id, request_options: {})
      #
      # @param request_id [String] The request ID (format `req_*`)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::LogRetrieveResponse]
      #
      # @see ArkEmail::Models::LogRetrieveParams
      def retrieve(request_id, params = {})
        @client.request(
          method: :get,
          path: ["logs/%1$s", request_id],
          model: ArkEmail::Models::LogRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::LogListParams} for more details.
      #
      # Retrieve a paginated list of API request logs for debugging and monitoring.
      # Results are ordered by timestamp, newest first.
      #
      # **Use cases:**
      #
      # - Debug integration issues by reviewing recent requests
      # - Monitor error rates and response times
      # - Audit API usage patterns
      #
      # **Filters:**
      #
      # - `status` - Filter by success or error category
      # - `statusCode` - Filter by exact HTTP status code
      # - `endpoint` - Filter by endpoint name (e.g., `emails.send`)
      # - `credentialId` - Filter by API key
      # - `startDate`/`endDate` - Filter by date range
      #
      # **Note:** Request and response bodies are only included when retrieving a single
      # log entry with `GET /logs/{requestId}`.
      #
      # **Related endpoints:**
      #
      # - `GET /logs/{requestId}` - Get full log details with request/response bodies
      #
      # @overload list(credential_id: nil, end_date: nil, endpoint: nil, page: nil, per_page: nil, request_id: nil, start_date: nil, status: nil, status_code: nil, request_options: {})
      #
      # @param credential_id [String] Filter by API credential ID
      #
      # @param end_date [Time] Filter logs before this date (ISO 8601 format)
      #
      # @param endpoint [String] Filter by endpoint name
      #
      # @param page [Integer] Page number
      #
      # @param per_page [Integer] Results per page (max 100)
      #
      # @param request_id [String] Filter by request ID (partial match)
      #
      # @param start_date [Time] Filter logs after this date (ISO 8601 format)
      #
      # @param status [Symbol, ArkEmail::Models::LogListParams::Status] Filter by status category:
      #
      # @param status_code [Integer] Filter by exact HTTP status code (100-599)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::LogEntry>]
      #
      # @see ArkEmail::Models::LogListParams
      def list(params = {})
        parsed, options = ArkEmail::LogListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "logs",
          query: parsed.transform_keys(
            credential_id: "credentialId",
            end_date: "endDate",
            per_page: "perPage",
            request_id: "requestId",
            start_date: "startDate",
            status_code: "statusCode"
          ),
          page: ArkEmail::Internal::PageNumberPagination,
          model: ArkEmail::LogEntry,
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
