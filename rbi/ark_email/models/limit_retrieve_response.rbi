# typed: strong

module ArkEmail
  module Models
    class LimitRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::LimitRetrieveResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      # Current usage and limit information
      sig { returns(ArkEmail::LimitsData) }
      attr_reader :data

      sig { params(data: ArkEmail::LimitsData::OrHash).void }
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Account rate limits and send limits response
      sig do
        params(
          data: ArkEmail::LimitsData::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Current usage and limit information
        data:,
        meta:,
        success: true
      )
      end

      sig do
        override.returns(
          {
            data: ArkEmail::LimitsData,
            meta: ArkEmail::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
