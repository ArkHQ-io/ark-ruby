# typed: strong

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
      sig do
        params(
          request_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::LogRetrieveResponse)
      end
      def retrieve(
        # The request ID (format `req_*`)
        request_id,
        request_options: {}
      )
      end

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
      sig do
        params(
          credential_id: String,
          end_date: Time,
          endpoint: String,
          page: Integer,
          per_page: Integer,
          request_id: String,
          start_date: Time,
          status: ArkEmail::LogListParams::Status::OrSymbol,
          status_code: Integer,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Internal::PageNumberPagination[ArkEmail::LogEntry])
      end
      def list(
        # Filter by API credential ID
        credential_id: nil,
        # Filter logs before this date (ISO 8601 format)
        end_date: nil,
        # Filter by endpoint name
        endpoint: nil,
        # Page number
        page: nil,
        # Results per page (max 100)
        per_page: nil,
        # Filter by request ID (partial match)
        request_id: nil,
        # Filter logs after this date (ISO 8601 format)
        start_date: nil,
        # Filter by status category:
        #
        # - `success` - Status codes < 400
        # - `error` - Status codes >= 400
        status: nil,
        # Filter by exact HTTP status code (100-599)
        status_code: nil,
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
