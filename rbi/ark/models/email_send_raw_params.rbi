# typed: strong

module Ark
  module Models
    class EmailSendRawParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(Ark::EmailSendRawParams, Ark::Internal::AnyHash) }

      # Base64-encoded RFC 2822 message
      sig { returns(String) }
      attr_accessor :data

      # Envelope sender address
      sig { returns(String) }
      attr_accessor :mail_from

      # Envelope recipient addresses
      sig { returns(T::Array[String]) }
      attr_accessor :rcpt_to

      sig do
        params(
          data: String,
          mail_from: String,
          rcpt_to: T::Array[String],
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Base64-encoded RFC 2822 message
        data:,
        # Envelope sender address
        mail_from:,
        # Envelope recipient addresses
        rcpt_to:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            data: String,
            mail_from: String,
            rcpt_to: T::Array[String],
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
