# typed: strong

module Ark
  module Models
    class Delivery < Ark::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Ark::Delivery, Ark::Internal::AnyHash) }

      # Delivery attempt ID
      sig { returns(String) }
      attr_accessor :id

      # Delivery status (lowercase)
      sig { returns(String) }
      attr_accessor :status

      # Unix timestamp
      sig { returns(Float) }
      attr_accessor :timestamp

      # ISO 8601 timestamp
      sig { returns(Time) }
      attr_accessor :timestamp_iso

      # SMTP response code
      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      # Status details
      sig { returns(T.nilable(String)) }
      attr_reader :details

      sig { params(details: String).void }
      attr_writer :details

      # SMTP server response from the receiving mail server
      sig { returns(T.nilable(String)) }
      attr_reader :output

      sig { params(output: String).void }
      attr_writer :output

      # Whether TLS was used
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sent_with_ssl

      sig { params(sent_with_ssl: T::Boolean).void }
      attr_writer :sent_with_ssl

      sig do
        params(
          id: String,
          status: String,
          timestamp: Float,
          timestamp_iso: Time,
          code: Integer,
          details: String,
          output: String,
          sent_with_ssl: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Delivery attempt ID
        id:,
        # Delivery status (lowercase)
        status:,
        # Unix timestamp
        timestamp:,
        # ISO 8601 timestamp
        timestamp_iso:,
        # SMTP response code
        code: nil,
        # Status details
        details: nil,
        # SMTP server response from the receiving mail server
        output: nil,
        # Whether TLS was used
        sent_with_ssl: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            status: String,
            timestamp: Float,
            timestamp_iso: Time,
            code: Integer,
            details: String,
            output: String,
            sent_with_ssl: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
