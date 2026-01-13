# typed: strong

module ArkEmail
  module Models
    class SuppressionBulkCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::SuppressionBulkCreateParams,
            ArkEmail::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[ArkEmail::SuppressionBulkCreateParams::Suppression])
      end
      attr_accessor :suppressions

      sig do
        params(
          suppressions:
            T::Array[
              ArkEmail::SuppressionBulkCreateParams::Suppression::OrHash
            ],
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(suppressions:, request_options: {})
      end

      sig do
        override.returns(
          {
            suppressions:
              T::Array[ArkEmail::SuppressionBulkCreateParams::Suppression],
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Suppression < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::SuppressionBulkCreateParams::Suppression,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :address

        sig { returns(T.nilable(String)) }
        attr_reader :reason

        sig { params(reason: String).void }
        attr_writer :reason

        sig do
          params(address: String, reason: String).returns(T.attached_class)
        end
        def self.new(address:, reason: nil)
        end

        sig { override.returns({ address: String, reason: String }) }
        def to_hash
        end
      end
    end
  end
end
