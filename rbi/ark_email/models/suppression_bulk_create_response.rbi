# typed: strong

module ArkEmail
  module Models
    class SuppressionBulkCreateResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::SuppressionBulkCreateResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::SuppressionBulkCreateResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: ArkEmail::Models::SuppressionBulkCreateResponse::Data::OrHash
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
          data: ArkEmail::Models::SuppressionBulkCreateResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::SuppressionBulkCreateResponse::Data,
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
              ArkEmail::Models::SuppressionBulkCreateResponse::Data,
              ArkEmail::Internal::AnyHash
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
