# typed: strong

module Ark
  module Models
    class EmailGetDeliveriesResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailGetDeliveriesResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::EmailGetDeliveriesResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::EmailGetDeliveriesResponse::Data::OrHash).void
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
          data: Ark::Models::EmailGetDeliveriesResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::EmailGetDeliveriesResponse::Data,
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
              Ark::Models::EmailGetDeliveriesResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Ark::Delivery]) }
        attr_accessor :deliveries

        # Internal message ID
        sig { returns(String) }
        attr_accessor :message_id

        # Message token
        sig { returns(String) }
        attr_accessor :message_token

        sig do
          params(
            deliveries: T::Array[Ark::Delivery::OrHash],
            message_id: String,
            message_token: String
          ).returns(T.attached_class)
        end
        def self.new(
          deliveries:,
          # Internal message ID
          message_id:,
          # Message token
          message_token:
        )
        end

        sig do
          override.returns(
            {
              deliveries: T::Array[Ark::Delivery],
              message_id: String,
              message_token: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
