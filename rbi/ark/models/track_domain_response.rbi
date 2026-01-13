# typed: strong

module Ark
  module Models
    class TrackDomainResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Ark::TrackDomainResponse, Ark::Internal::AnyHash) }

      sig { returns(Ark::TrackDomain) }
      attr_reader :data

      sig { params(data: Ark::TrackDomain::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(Ark::TrackDomainResponse::Success::TaggedBoolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::TrackDomain::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::TrackDomainResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::TrackDomain,
            meta: Ark::APIMeta,
            success: Ark::TrackDomainResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias { T.all(T::Boolean, Ark::TrackDomainResponse::Success) }
        OrBoolean = T.type_alias { T::Boolean }

        TRUE = T.let(true, Ark::TrackDomainResponse::Success::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Ark::TrackDomainResponse::Success::TaggedBoolean]
          )
        end
        def self.values
        end
      end
    end
  end
end
