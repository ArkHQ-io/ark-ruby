# typed: strong

module ArkEmail
  module Models
    class TenantDeleteResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::TenantDeleteResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::TenantDeleteResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::TenantDeleteResponse::Data::OrHash).void
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
          data: ArkEmail::Models::TenantDeleteResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::TenantDeleteResponse::Data,
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
              ArkEmail::Models::TenantDeleteResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :deleted

        sig { params(deleted: T::Boolean).returns(T.attached_class) }
        def self.new(deleted: true)
        end

        sig { override.returns({ deleted: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
