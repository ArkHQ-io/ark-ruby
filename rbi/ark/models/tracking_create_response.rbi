# typed: strong

module Ark
  module Models
    class TrackingCreateResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::TrackingCreateResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::TrackDomain) }
      attr_reader :data

      sig { params(data: Ark::TrackDomain::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::TrackingCreateResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::TrackDomain::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::TrackingCreateResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::TrackDomain,
            meta: Ark::APIMeta,
            success: Ark::Models::TrackingCreateResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::TrackingCreateResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::TrackingCreateResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::TrackingCreateResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
