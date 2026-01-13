# typed: strong

module Ark
  module Models
    class SuppressionBulkCreateResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Ark::Models::SuppressionBulkCreateResponse,
            Ark::Internal::AnyHash
          )
        end

      sig { returns(Ark::Models::SuppressionBulkCreateResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Ark::Models::SuppressionBulkCreateResponse::Data::OrHash
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
          data: Ark::Models::SuppressionBulkCreateResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::SuppressionBulkCreateResponse::Data,
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
              Ark::Models::SuppressionBulkCreateResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Newly suppressed addresses
        sig { returns(Integer) }
        attr_accessor :added

        # Invalid addresses skipped
        sig { returns(Integer) }
        attr_accessor :failed

        # Total addresses in request
        sig { returns(Integer) }
        attr_accessor :total_requested

        # Already suppressed addresses (updated reason)
        sig { returns(Integer) }
        attr_accessor :updated

        sig do
          params(
            added: Integer,
            failed: Integer,
            total_requested: Integer,
            updated: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Newly suppressed addresses
          added:,
          # Invalid addresses skipped
          failed:,
          # Total addresses in request
          total_requested:,
          # Already suppressed addresses (updated reason)
          updated:
        )
        end

        sig do
          override.returns(
            {
              added: Integer,
              failed: Integer,
              total_requested: Integer,
              updated: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
