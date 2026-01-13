# typed: strong

module ArkEmail
  module Models
    class SuppressionRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::SuppressionRetrieveResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::SuppressionRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: ArkEmail::Models::SuppressionRetrieveResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: ArkEmail::Models::SuppressionRetrieveResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::SuppressionRetrieveResponse::Data,
            meta: ArkEmail::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::SuppressionRetrieveResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # The email address that was checked
        sig { returns(String) }
        attr_accessor :address

        # Whether the address is currently suppressed
        sig { returns(T::Boolean) }
        attr_accessor :suppressed

        # When the suppression was created (if suppressed)
        sig { returns(T.nilable(Time)) }
        attr_accessor :created_at

        # Reason for suppression (if suppressed)
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        sig do
          params(
            address: String,
            suppressed: T::Boolean,
            created_at: T.nilable(Time),
            reason: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The email address that was checked
          address:,
          # Whether the address is currently suppressed
          suppressed:,
          # When the suppression was created (if suppressed)
          created_at: nil,
          # Reason for suppression (if suppressed)
          reason: nil
        )
        end

        sig do
          override.returns(
            {
              address: String,
              suppressed: T::Boolean,
              created_at: T.nilable(Time),
              reason: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
