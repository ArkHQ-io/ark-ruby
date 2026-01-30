# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Logs#list
    class LogEntry < ArkEmail::Internal::Type::BaseModel
      # @!attribute context
      #   Request context information
      #
      #   @return [ArkEmail::Models::LogEntry::Context]
      required :context, -> { ArkEmail::LogEntry::Context }

      # @!attribute credential
      #   API credential information
      #
      #   @return [ArkEmail::Models::LogEntry::Credential]
      required :credential, -> { ArkEmail::LogEntry::Credential }

      # @!attribute duration_ms
      #   Request duration in milliseconds
      #
      #   @return [Integer]
      required :duration_ms, Integer, api_name: :durationMs

      # @!attribute endpoint
      #   Semantic endpoint name
      #
      #   @return [String]
      required :endpoint, String

      # @!attribute method_
      #   HTTP method
      #
      #   @return [Symbol, ArkEmail::Models::LogEntry::Method]
      required :method_, enum: -> { ArkEmail::LogEntry::Method }, api_name: :method

      # @!attribute path
      #   Request path
      #
      #   @return [String]
      required :path, String

      # @!attribute rate_limit
      #   Rate limit state at time of request
      #
      #   @return [ArkEmail::Models::LogEntry::RateLimit]
      required :rate_limit, -> { ArkEmail::LogEntry::RateLimit }, api_name: :rateLimit

      # @!attribute request_id
      #   Unique request identifier
      #
      #   @return [String]
      required :request_id, String, api_name: :requestId

      # @!attribute status_code
      #   HTTP response status code
      #
      #   @return [Integer]
      required :status_code, Integer, api_name: :statusCode

      # @!attribute timestamp
      #   When the request was made (ISO 8601)
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute email
      #   Email-specific data (for email endpoints)
      #
      #   @return [ArkEmail::Models::LogEntry::Email, nil]
      optional :email, -> { ArkEmail::LogEntry::Email }, nil?: true

      # @!attribute error
      #   Error details (null if request succeeded)
      #
      #   @return [ArkEmail::Models::LogEntry::Error, nil]
      optional :error, -> { ArkEmail::LogEntry::Error }, nil?: true

      # @!attribute sdk
      #   SDK information (null if not using an SDK)
      #
      #   @return [ArkEmail::Models::LogEntry::SDK, nil]
      optional :sdk, -> { ArkEmail::LogEntry::SDK }, nil?: true

      # @!method initialize(context:, credential:, duration_ms:, endpoint:, method_:, path:, rate_limit:, request_id:, status_code:, timestamp:, email: nil, error: nil, sdk: nil)
      #   API request log entry (list view)
      #
      #   @param context [ArkEmail::Models::LogEntry::Context] Request context information
      #
      #   @param credential [ArkEmail::Models::LogEntry::Credential] API credential information
      #
      #   @param duration_ms [Integer] Request duration in milliseconds
      #
      #   @param endpoint [String] Semantic endpoint name
      #
      #   @param method_ [Symbol, ArkEmail::Models::LogEntry::Method] HTTP method
      #
      #   @param path [String] Request path
      #
      #   @param rate_limit [ArkEmail::Models::LogEntry::RateLimit] Rate limit state at time of request
      #
      #   @param request_id [String] Unique request identifier
      #
      #   @param status_code [Integer] HTTP response status code
      #
      #   @param timestamp [Time] When the request was made (ISO 8601)
      #
      #   @param email [ArkEmail::Models::LogEntry::Email, nil] Email-specific data (for email endpoints)
      #
      #   @param error [ArkEmail::Models::LogEntry::Error, nil] Error details (null if request succeeded)
      #
      #   @param sdk [ArkEmail::Models::LogEntry::SDK, nil] SDK information (null if not using an SDK)

      # @see ArkEmail::Models::LogEntry#context
      class Context < ArkEmail::Internal::Type::BaseModel
        # @!attribute idempotency_key
        #   Idempotency key if provided
        #
        #   @return [String, nil]
        optional :idempotency_key, String, api_name: :idempotencyKey, nil?: true

        # @!attribute ip_address
        #   Client IP address
        #
        #   @return [String, nil]
        optional :ip_address, String, api_name: :ipAddress, nil?: true

        # @!attribute query_params
        #   Query parameters
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :query_params,
                 ArkEmail::Internal::Type::HashOf[ArkEmail::Internal::Type::Unknown],
                 api_name: :queryParams,
                 nil?: true

        # @!attribute user_agent
        #   User-Agent header
        #
        #   @return [String, nil]
        optional :user_agent, String, api_name: :userAgent, nil?: true

        # @!method initialize(idempotency_key: nil, ip_address: nil, query_params: nil, user_agent: nil)
        #   Request context information
        #
        #   @param idempotency_key [String, nil] Idempotency key if provided
        #
        #   @param ip_address [String, nil] Client IP address
        #
        #   @param query_params [Hash{Symbol=>Object}, nil] Query parameters
        #
        #   @param user_agent [String, nil] User-Agent header
      end

      # @see ArkEmail::Models::LogEntry#credential
      class Credential < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Credential ID
        #
        #   @return [String]
        required :id, String

        # @!attribute key_prefix
        #   API key prefix (first 8 characters)
        #
        #   @return [String, nil]
        optional :key_prefix, String, api_name: :keyPrefix, nil?: true

        # @!method initialize(id:, key_prefix: nil)
        #   API credential information
        #
        #   @param id [String] Credential ID
        #
        #   @param key_prefix [String, nil] API key prefix (first 8 characters)
      end

      # HTTP method
      #
      # @see ArkEmail::Models::LogEntry#method_
      module Method
        extend ArkEmail::Internal::Type::Enum

        GET = :GET
        POST = :POST
        PUT = :PUT
        PATCH = :PATCH
        DELETE = :DELETE

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ArkEmail::Models::LogEntry#rate_limit
      class RateLimit < ArkEmail::Internal::Type::BaseModel
        # @!attribute limit
        #   Rate limit ceiling
        #
        #   @return [Integer, nil]
        optional :limit, Integer, nil?: true

        # @!attribute limited
        #   Whether the request was rate limited
        #
        #   @return [Boolean, nil]
        optional :limited, ArkEmail::Internal::Type::Boolean

        # @!attribute remaining
        #   Remaining requests in window
        #
        #   @return [Integer, nil]
        optional :remaining, Integer, nil?: true

        # @!attribute reset
        #   Unix timestamp when limit resets
        #
        #   @return [Integer, nil]
        optional :reset, Integer, nil?: true

        # @!method initialize(limit: nil, limited: nil, remaining: nil, reset: nil)
        #   Rate limit state at time of request
        #
        #   @param limit [Integer, nil] Rate limit ceiling
        #
        #   @param limited [Boolean] Whether the request was rate limited
        #
        #   @param remaining [Integer, nil] Remaining requests in window
        #
        #   @param reset [Integer, nil] Unix timestamp when limit resets
      end

      # @see ArkEmail::Models::LogEntry#email
      class Email < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Email message identifier (token)
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute recipient_count
        #   Number of recipients
        #
        #   @return [Integer, nil]
        optional :recipient_count, Integer, api_name: :recipientCount, nil?: true

        # @!method initialize(id: nil, recipient_count: nil)
        #   Email-specific data (for email endpoints)
        #
        #   @param id [String] Email message identifier (token)
        #
        #   @param recipient_count [Integer, nil] Number of recipients
      end

      # @see ArkEmail::Models::LogEntry#error
      class Error < ArkEmail::Internal::Type::BaseModel
        # @!attribute code
        #   Error code
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute message
        #   Error message
        #
        #   @return [String, nil]
        optional :message, String, nil?: true

        # @!method initialize(code: nil, message: nil)
        #   Error details (null if request succeeded)
        #
        #   @param code [String] Error code
        #
        #   @param message [String, nil] Error message
      end

      # @see ArkEmail::Models::LogEntry#sdk
      class SDK < ArkEmail::Internal::Type::BaseModel
        # @!attribute name
        #   SDK name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute version
        #   SDK version
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!method initialize(name: nil, version: nil)
        #   SDK information (null if not using an SDK)
        #
        #   @param name [String] SDK name
        #
        #   @param version [String, nil] SDK version
      end
    end
  end
end
