# typed: strong

module Ark
  module Models
    class SuppressionCreateResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::SuppressionCreateResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::SuppressionCreateResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::SuppressionCreateResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::SuppressionCreateResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::SuppressionCreateResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::SuppressionCreateResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::SuppressionCreateResponse::Data,
            meta: Ark::APIMeta,
            success:
              Ark::Models::SuppressionCreateResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::SuppressionCreateResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Suppression ID
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :address

        sig { returns(Time) }
        attr_accessor :created_at

        # Reason for suppression
        sig { returns(T.nilable(String)) }
        attr_reader :reason

        sig { params(reason: String).void }
        attr_writer :reason

        sig do
          params(
            id: String,
            address: String,
            created_at: Time,
            reason: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Suppression ID
          id:,
          address:,
          created_at:,
          # Reason for suppression
          reason: nil
        )
        end

        sig do
          override.returns(
            { id: String, address: String, created_at: Time, reason: String }
          )
        end
        def to_hash
        end
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::SuppressionCreateResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::SuppressionCreateResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::SuppressionCreateResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
