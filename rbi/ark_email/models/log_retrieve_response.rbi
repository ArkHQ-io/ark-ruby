# typed: strong

module ArkEmail
  module Models
    class LogRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::LogRetrieveResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      # Full API request log entry with bodies
      sig { returns(ArkEmail::LogEntryDetail) }
      attr_reader :data

      sig { params(data: ArkEmail::LogEntryDetail::OrHash).void }
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Detailed API request log with request/response bodies
      sig do
        params(
          data: ArkEmail::LogEntryDetail::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Full API request log entry with bodies
        data:,
        meta:,
        success: true
      )
      end

      sig do
        override.returns(
          {
            data: ArkEmail::LogEntryDetail,
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
