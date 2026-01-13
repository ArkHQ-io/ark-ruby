# typed: strong

module Ark
  module Models
    class TrackingListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::TrackingListResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::TrackingListResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::TrackingListResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::TrackingListResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::TrackingListResponse::Data,
            meta: Ark::APIMeta,
            success: T::Boolean
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

        sig { returns(T::Array[Ark::TrackDomain]) }
        attr_accessor :track_domains

        sig do
          params(track_domains: T::Array[Ark::TrackDomain::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(track_domains:)
        end

        sig { override.returns({ track_domains: T::Array[Ark::TrackDomain] }) }
        def to_hash
        end
      end
    end
  end
end
