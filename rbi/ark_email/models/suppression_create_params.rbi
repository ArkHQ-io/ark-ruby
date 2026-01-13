# typed: strong

module ArkEmail
  module Models
    class SuppressionCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::SuppressionCreateParams, ArkEmail::Internal::AnyHash)
        end

      # Email address to suppress
      sig { returns(String) }
      attr_accessor :address

      # Reason for suppression (accepts null)
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      sig do
        params(
          address: String,
          reason: T.nilable(String),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Email address to suppress
        address:,
        # Reason for suppression (accepts null)
        reason: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            address: String,
            reason: T.nilable(String),
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
