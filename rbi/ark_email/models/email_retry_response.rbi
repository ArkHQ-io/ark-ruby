# typed: strong

module ArkEmail
  module Models
    class EmailRetryResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::EmailRetryResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::EmailRetryResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::EmailRetryResponse::Data::OrHash).void
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
          data: ArkEmail::Models::EmailRetryResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::EmailRetryResponse::Data,
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
              ArkEmail::Models::EmailRetryResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Email identifier (token)
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :message

        # The tenant ID this email belongs to
        sig { returns(String) }
        attr_accessor :tenant_id

        sig do
          params(id: String, message: String, tenant_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Email identifier (token)
          id:,
          message:,
          # The tenant ID this email belongs to
          tenant_id:
        )
        end

        sig do
          override.returns({ id: String, message: String, tenant_id: String })
        end
        def to_hash
        end
      end
    end
  end
end
