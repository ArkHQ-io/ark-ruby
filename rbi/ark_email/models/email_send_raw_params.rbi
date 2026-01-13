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

      # Base64-encoded RFC 2822 message
      sig { returns(String) }
      attr_accessor :data

      # Envelope sender address
      sig { returns(String) }
      attr_accessor :mail_from

      # Envelope recipient addresses
      sig { returns(T::Array[String]) }
      attr_accessor :rcpt_to

      # Whether this is a bounce message (accepts null)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :bounce

      sig do
        params(
          data: String,
          mail_from: String,
          rcpt_to: T::Array[String],
          bounce: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Base64-encoded RFC 2822 message
        data:,
        # Envelope sender address
        mail_from:,
        # Envelope recipient addresses
        rcpt_to:,
        # Whether this is a bounce message (accepts null)
        bounce: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            data: String,
            mail_from: String,
            rcpt_to: T::Array[String],
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
