# typed: strong

module Ark
  module Models
    class SuppressionBulkCreateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Ark::SuppressionBulkCreateParams, Ark::Internal::AnyHash)
        end

      sig { returns(T::Array[Ark::SuppressionBulkCreateParams::Suppression]) }
      attr_accessor :suppressions

      sig do
        params(
          suppressions:
            T::Array[Ark::SuppressionBulkCreateParams::Suppression::OrHash],
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(suppressions:, request_options: {})
      end

      sig do
        override.returns(
          {
            suppressions:
              T::Array[Ark::SuppressionBulkCreateParams::Suppression],
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Suppression < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::SuppressionBulkCreateParams::Suppression,
              Ark::Internal::AnyHash
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
