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

      sig { returns(T.nilable(Ark::Models::SuppressionRetrieveResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: Ark::Models::SuppressionRetrieveResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          data: Ark::Models::SuppressionRetrieveResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data: nil, success: nil)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::SuppressionRetrieveResponse::Data,
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

        sig { returns(T.nilable(String)) }
        attr_reader :address

        sig { params(address: String).void }
        attr_writer :address

        sig { returns(T.nilable(Time)) }
        attr_accessor :created_at

        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :suppressed

        sig { params(suppressed: T::Boolean).void }
        attr_writer :suppressed

        sig do
          params(
            address: String,
            created_at: T.nilable(Time),
            reason: T.nilable(String),
            suppressed: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          address: nil,
          created_at: nil,
          reason: nil,
          suppressed: nil
        )
        end

        sig do
          override.returns(
            {
              address: String,
              created_at: T.nilable(Time),
              reason: T.nilable(String),
              suppressed: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
