# typed: strong

module Ark
  module Models
    class WebhookDeleteResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::WebhookDeleteResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::WebhookDeleteResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::WebhookDeleteResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::WebhookDeleteResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::WebhookDeleteResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::WebhookDeleteResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::WebhookDeleteResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::WebhookDeleteResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::WebhookDeleteResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :message

        sig { params(message: String).returns(T.attached_class) }
        def self.new(message:)
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::WebhookDeleteResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::WebhookDeleteResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[Ark::Models::WebhookDeleteResponse::Success::TaggedBoolean]
          )
        end
        def self.values
        end
      end
    end
  end
end
