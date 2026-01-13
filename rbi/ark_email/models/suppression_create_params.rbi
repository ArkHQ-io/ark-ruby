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

      # Reason for suppression
      sig { returns(T.nilable(String)) }
      attr_reader :reason

      sig { params(reason: String).void }
      attr_writer :reason

      sig do
        params(
          address: String,
          reason: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Email address to suppress
        address:,
        # Reason for suppression
        reason: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            address: String,
            reason: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
