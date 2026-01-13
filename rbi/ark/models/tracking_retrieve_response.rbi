# typed: strong

module Ark
  module Models
    class TrackingRetrieveResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::TrackingRetrieveResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::TrackDomain) }
      attr_reader :data

      sig { params(data: Ark::TrackDomain::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::TrackDomain::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          { data: Ark::TrackDomain, meta: Ark::APIMeta, success: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
