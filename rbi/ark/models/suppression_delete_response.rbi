# typed: strong

module Ark
  module Models
    class SuppressionDeleteResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::SuppressionDeleteResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::SuppressionDeleteResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::SuppressionDeleteResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::SuppressionDeleteResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::SuppressionDeleteResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::SuppressionDeleteResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::SuppressionDeleteResponse::Data,
            meta: Ark::APIMeta,
            success:
              Ark::Models::SuppressionDeleteResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::SuppressionDeleteResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :message

        sig { params(message: String).returns(T.attached_class) }
        def self.new(message:)
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::SuppressionDeleteResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::SuppressionDeleteResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::SuppressionDeleteResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
