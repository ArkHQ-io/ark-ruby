# typed: strong

module Ark
  module Models
    class SuppressionRetrieveResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Ark::Models::SuppressionRetrieveResponse,
            Ark::Internal::AnyHash
          )
        end

      sig { returns(Ark::Models::SuppressionRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Ark::Models::SuppressionRetrieveResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::SuppressionRetrieveResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::SuppressionRetrieveResponse::Data,
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
              Ark::Models::SuppressionRetrieveResponse::Data,
              Ark::Internal::AnyHash
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
