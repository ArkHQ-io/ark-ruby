# typed: strong

module Ark
  module Models
    class TrackingDeleteResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::TrackingDeleteResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::TrackingDeleteResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::TrackingDeleteResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::TrackingDeleteResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::TrackingDeleteResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::TrackingDeleteResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::TrackingDeleteResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::TrackingDeleteResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::TrackingDeleteResponse::Data,
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
            T.all(T::Boolean, Ark::Models::TrackingDeleteResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::TrackingDeleteResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::TrackingDeleteResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
