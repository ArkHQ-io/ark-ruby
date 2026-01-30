# typed: strong

module ArkEmail
  module Models
    class LogEntry < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(ArkEmail::LogEntry, ArkEmail::Internal::AnyHash) }

      # Request context information
      sig { returns(ArkEmail::LogEntry::Context) }
      attr_reader :context

      sig { params(context: ArkEmail::LogEntry::Context::OrHash).void }
      attr_writer :context

      # API credential information
      sig { returns(ArkEmail::LogEntry::Credential) }
      attr_reader :credential

      sig { params(credential: ArkEmail::LogEntry::Credential::OrHash).void }
      attr_writer :credential

      # Request duration in milliseconds
      sig { returns(Integer) }
      attr_accessor :duration_ms

      # Semantic endpoint name
      sig { returns(String) }
      attr_accessor :endpoint

      # HTTP method
      sig { returns(ArkEmail::LogEntry::Method::TaggedSymbol) }
      attr_accessor :method_

      # Request path
      sig { returns(String) }
      attr_accessor :path

      # Rate limit state at time of request
      sig { returns(ArkEmail::LogEntry::RateLimit) }
      attr_reader :rate_limit

      sig { params(rate_limit: ArkEmail::LogEntry::RateLimit::OrHash).void }
      attr_writer :rate_limit

      # Unique request identifier
      sig { returns(String) }
      attr_accessor :request_id

      # HTTP response status code
      sig { returns(Integer) }
      attr_accessor :status_code

      # When the request was made (ISO 8601)
      sig { returns(Time) }
      attr_accessor :timestamp

      # Email-specific data (for email endpoints)
      sig { returns(T.nilable(ArkEmail::LogEntry::Email)) }
      attr_reader :email

      sig { params(email: T.nilable(ArkEmail::LogEntry::Email::OrHash)).void }
      attr_writer :email

      # Error details (null if request succeeded)
      sig { returns(T.nilable(ArkEmail::LogEntry::Error)) }
      attr_reader :error

      sig { params(error: T.nilable(ArkEmail::LogEntry::Error::OrHash)).void }
      attr_writer :error

      # SDK information (null if not using an SDK)
      sig { returns(T.nilable(ArkEmail::LogEntry::SDK)) }
      attr_reader :sdk

      sig { params(sdk: T.nilable(ArkEmail::LogEntry::SDK::OrHash)).void }
      attr_writer :sdk

      # API request log entry (list view)
      sig do
        params(
          context: ArkEmail::LogEntry::Context::OrHash,
          credential: ArkEmail::LogEntry::Credential::OrHash,
          duration_ms: Integer,
          endpoint: String,
          method_: ArkEmail::LogEntry::Method::OrSymbol,
          path: String,
          rate_limit: ArkEmail::LogEntry::RateLimit::OrHash,
          request_id: String,
          status_code: Integer,
          timestamp: Time,
          email: T.nilable(ArkEmail::LogEntry::Email::OrHash),
          error: T.nilable(ArkEmail::LogEntry::Error::OrHash),
          sdk: T.nilable(ArkEmail::LogEntry::SDK::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Request context information
        context:,
        # API credential information
        credential:,
        # Request duration in milliseconds
        duration_ms:,
        # Semantic endpoint name
        endpoint:,
        # HTTP method
        method_:,
        # Request path
        path:,
        # Rate limit state at time of request
        rate_limit:,
        # Unique request identifier
        request_id:,
        # HTTP response status code
        status_code:,
        # When the request was made (ISO 8601)
        timestamp:,
        # Email-specific data (for email endpoints)
        email: nil,
        # Error details (null if request succeeded)
        error: nil,
        # SDK information (null if not using an SDK)
        sdk: nil
      )
      end

      sig do
        override.returns(
          {
            context: ArkEmail::LogEntry::Context,
            credential: ArkEmail::LogEntry::Credential,
            duration_ms: Integer,
            endpoint: String,
            method_: ArkEmail::LogEntry::Method::TaggedSymbol,
            path: String,
            rate_limit: ArkEmail::LogEntry::RateLimit,
            request_id: String,
            status_code: Integer,
            timestamp: Time,
            email: T.nilable(ArkEmail::LogEntry::Email),
            error: T.nilable(ArkEmail::LogEntry::Error),
            sdk: T.nilable(ArkEmail::LogEntry::SDK)
          }
        )
      end
      def to_hash
      end

      class Context < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LogEntry::Context, ArkEmail::Internal::AnyHash)
          end

        # Idempotency key if provided
        sig { returns(T.nilable(String)) }
        attr_accessor :idempotency_key

        # Client IP address
        sig { returns(T.nilable(String)) }
        attr_accessor :ip_address

        # Query parameters
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :query_params

        # User-Agent header
        sig { returns(T.nilable(String)) }
        attr_accessor :user_agent

        # Request context information
        sig do
          params(
            idempotency_key: T.nilable(String),
            ip_address: T.nilable(String),
            query_params: T.nilable(T::Hash[Symbol, T.anything]),
            user_agent: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Idempotency key if provided
          idempotency_key: nil,
          # Client IP address
          ip_address: nil,
          # Query parameters
          query_params: nil,
          # User-Agent header
          user_agent: nil
        )
        end

        sig do
          override.returns(
            {
              idempotency_key: T.nilable(String),
              ip_address: T.nilable(String),
              query_params: T.nilable(T::Hash[Symbol, T.anything]),
              user_agent: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class Credential < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LogEntry::Credential, ArkEmail::Internal::AnyHash)
          end

        # Credential ID
        sig { returns(String) }
        attr_accessor :id

        # API key prefix (first 8 characters)
        sig { returns(T.nilable(String)) }
        attr_accessor :key_prefix

        # API credential information
        sig do
          params(id: String, key_prefix: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credential ID
          id:,
          # API key prefix (first 8 characters)
          key_prefix: nil
        )
        end

        sig { override.returns({ id: String, key_prefix: T.nilable(String) }) }
        def to_hash
        end
      end

      # HTTP method
      module Method
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::LogEntry::Method) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GET = T.let(:GET, ArkEmail::LogEntry::Method::TaggedSymbol)
        POST = T.let(:POST, ArkEmail::LogEntry::Method::TaggedSymbol)
        PUT = T.let(:PUT, ArkEmail::LogEntry::Method::TaggedSymbol)
        PATCH = T.let(:PATCH, ArkEmail::LogEntry::Method::TaggedSymbol)
        DELETE = T.let(:DELETE, ArkEmail::LogEntry::Method::TaggedSymbol)

        sig do
          override.returns(T::Array[ArkEmail::LogEntry::Method::TaggedSymbol])
        end
        def self.values
        end
      end

      class RateLimit < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LogEntry::RateLimit, ArkEmail::Internal::AnyHash)
          end

        # Rate limit ceiling
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        # Whether the request was rate limited
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :limited

        sig { params(limited: T::Boolean).void }
        attr_writer :limited

        # Remaining requests in window
        sig { returns(T.nilable(Integer)) }
        attr_accessor :remaining

        # Unix timestamp when limit resets
        sig { returns(T.nilable(Integer)) }
        attr_accessor :reset

        # Rate limit state at time of request
        sig do
          params(
            limit: T.nilable(Integer),
            limited: T::Boolean,
            remaining: T.nilable(Integer),
            reset: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Rate limit ceiling
          limit: nil,
          # Whether the request was rate limited
          limited: nil,
          # Remaining requests in window
          remaining: nil,
          # Unix timestamp when limit resets
          reset: nil
        )
        end

        sig do
          override.returns(
            {
              limit: T.nilable(Integer),
              limited: T::Boolean,
              remaining: T.nilable(Integer),
              reset: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class Email < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LogEntry::Email, ArkEmail::Internal::AnyHash)
          end

        # Email message identifier (token)
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Number of recipients
        sig { returns(T.nilable(Integer)) }
        attr_accessor :recipient_count

        # Email-specific data (for email endpoints)
        sig do
          params(id: String, recipient_count: T.nilable(Integer)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Email message identifier (token)
          id: nil,
          # Number of recipients
          recipient_count: nil
        )
        end

        sig do
          override.returns({ id: String, recipient_count: T.nilable(Integer) })
        end
        def to_hash
        end
      end

      class Error < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LogEntry::Error, ArkEmail::Internal::AnyHash)
          end

        # Error code
        sig { returns(T.nilable(String)) }
        attr_reader :code

        sig { params(code: String).void }
        attr_writer :code

        # Error message
        sig { returns(T.nilable(String)) }
        attr_accessor :message

        # Error details (null if request succeeded)
        sig do
          params(code: String, message: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Error code
          code: nil,
          # Error message
          message: nil
        )
        end

        sig { override.returns({ code: String, message: T.nilable(String) }) }
        def to_hash
        end
      end

      class SDK < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LogEntry::SDK, ArkEmail::Internal::AnyHash)
          end

        # SDK name
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # SDK version
        sig { returns(T.nilable(String)) }
        attr_accessor :version

        # SDK information (null if not using an SDK)
        sig do
          params(name: String, version: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # SDK name
          name: nil,
          # SDK version
          version: nil
        )
        end

        sig { override.returns({ name: String, version: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
