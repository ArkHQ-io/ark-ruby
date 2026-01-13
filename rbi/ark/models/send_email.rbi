# typed: strong

module Ark
  module Models
    class SendEmail < Ark::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Ark::SendEmail, Ark::Internal::AnyHash) }

      sig { returns(Ark::SendEmail::Data) }
      attr_reader :data

      sig { params(data: Ark::SendEmail::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::SendEmail::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::SendEmail::Data,
            meta: Ark::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(Ark::SendEmail::Data, Ark::Internal::AnyHash) }

        # Unique message ID (format: msg*{id}*{token})
        sig { returns(String) }
        attr_accessor :id

        # Current delivery status
        sig { returns(Ark::SendEmail::Data::Status::TaggedSymbol) }
        attr_accessor :status

        # List of recipient addresses
        sig { returns(T::Array[String]) }
        attr_accessor :to

        # SMTP Message-ID header value
        sig { returns(T.nilable(String)) }
        attr_reader :message_id

        sig { params(message_id: String).void }
        attr_writer :message_id

        sig do
          params(
            id: String,
            status: Ark::SendEmail::Data::Status::OrSymbol,
            to: T::Array[String],
            message_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique message ID (format: msg*{id}*{token})
          id:,
          # Current delivery status
          status:,
          # List of recipient addresses
          to:,
          # SMTP Message-ID header value
          message_id: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              status: Ark::SendEmail::Data::Status::TaggedSymbol,
              to: T::Array[String],
              message_id: String
            }
          )
        end
        def to_hash
        end

        # Current delivery status
        module Status
          extend Ark::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Ark::SendEmail::Data::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING = T.let(:pending, Ark::SendEmail::Data::Status::TaggedSymbol)
          SENT = T.let(:sent, Ark::SendEmail::Data::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Ark::SendEmail::Data::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
