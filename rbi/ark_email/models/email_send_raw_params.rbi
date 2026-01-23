# typed: strong

module ArkEmail
  module Models
    class EmailSendRawParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailSendRawParams, ArkEmail::Internal::AnyHash)
        end

      # Sender email address
      sig { returns(String) }
      attr_accessor :from

      # Base64-encoded RFC 2822 MIME message
      sig { returns(String) }
      attr_accessor :raw_message

      # Recipient email addresses
      sig { returns(T::Array[String]) }
      attr_accessor :to

      # Whether this is a bounce message (accepts null)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :bounce

      sig do
        params(
          from: String,
          raw_message: String,
          to: T::Array[String],
          bounce: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Sender email address
        from:,
        # Base64-encoded RFC 2822 MIME message
        raw_message:,
        # Recipient email addresses
        to:,
        # Whether this is a bounce message (accepts null)
        bounce: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            from: String,
            raw_message: String,
            to: T::Array[String],
            bounce: T.nilable(T::Boolean),
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
