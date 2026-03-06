# typed: strong

module ArkEmail
  module Models
    class EmailRetryParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailRetryParams, ArkEmail::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :email_id

      sig do
        params(
          email_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(email_id:, request_options: {})
      end

      sig do
        override.returns(
          { email_id: String, request_options: ArkEmail::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
