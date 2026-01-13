# typed: strong

module Ark
  module Models
    class EmailSendResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailSendResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::EmailSendResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::EmailSendResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(Ark::Models::EmailSendResponse::Success::TaggedBoolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::EmailSendResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::EmailSendResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::EmailSendResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::EmailSendResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Ark::Models::EmailSendResponse::Data, Ark::Internal::AnyHash)
          end

        # Unique message ID (format: msg*{id}*{token})
        sig { returns(String) }
        attr_accessor :id

        # Current delivery status
        sig do
          returns(Ark::Models::EmailSendResponse::Data::Status::TaggedSymbol)
        end
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
            status: Ark::Models::EmailSendResponse::Data::Status::OrSymbol,
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
              status:
                Ark::Models::EmailSendResponse::Data::Status::TaggedSymbol,
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
            T.type_alias do
              T.all(Symbol, Ark::Models::EmailSendResponse::Data::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              Ark::Models::EmailSendResponse::Data::Status::TaggedSymbol
            )
          SENT =
            T.let(
              :sent,
              Ark::Models::EmailSendResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Ark::Models::EmailSendResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::EmailSendResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(true, Ark::Models::EmailSendResponse::Success::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Ark::Models::EmailSendResponse::Success::TaggedBoolean]
          )
        end
        def self.values
        end
      end
    end
  end
end
