# typed: strong

module Ark
  module Models
    class TrackingListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::TrackingListResponse, Ark::Internal::AnyHash)
        end

      sig { returns(T.nilable(Ark::Models::TrackingListResponse::Data)) }
      attr_reader :data

      sig { params(data: Ark::Models::TrackingListResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(T.nilable(Ark::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(
          T.nilable(Ark::Models::TrackingListResponse::Success::TaggedBoolean)
        )
      end
      attr_reader :success

      sig do
        params(
          success: Ark::Models::TrackingListResponse::Success::OrBoolean
        ).void
      end
      attr_writer :success

      sig do
        params(
          data: Ark::Models::TrackingListResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::TrackingListResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data: nil, meta: nil, success: nil)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::TrackingListResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::TrackingListResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::TrackingListResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[Ark::TrackDomain])) }
        attr_reader :track_domains

        sig { params(track_domains: T::Array[Ark::TrackDomain::OrHash]).void }
        attr_writer :track_domains

        sig do
          params(track_domains: T::Array[Ark::TrackDomain::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(track_domains: nil)
        end

        sig { override.returns({ track_domains: T::Array[Ark::TrackDomain] }) }
        def to_hash
        end
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::TrackingListResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(true, Ark::Models::TrackingListResponse::Success::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Ark::Models::TrackingListResponse::Success::TaggedBoolean]
          )
        end
        def self.values
        end
      end
    end
  end
end
