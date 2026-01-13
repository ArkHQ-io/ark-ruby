# typed: strong

module ArkEmail
  module Models
    class EmailSendRawResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::EmailSendRawResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::EmailSendRawResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::EmailSendRawResponse::Data::OrHash).void
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
          data: ArkEmail::Models::EmailSendRawResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::EmailSendRawResponse::Data,
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
              ArkEmail::Models::EmailSendRawResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Unique message ID (format: msg*{id}*{token})
        sig { returns(String) }
        attr_accessor :id

        # Current delivery status
        sig do
          returns(
            ArkEmail::Models::EmailSendRawResponse::Data::Status::TaggedSymbol
          )
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
            status:
              ArkEmail::Models::EmailSendRawResponse::Data::Status::OrSymbol,
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
                ArkEmail::Models::EmailSendRawResponse::Data::Status::TaggedSymbol,
              to: T::Array[String],
              message_id: String
            }
          )
        end
        def to_hash
        end

        # Current delivery status
        module Status
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ArkEmail::Models::EmailSendRawResponse::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ArkEmail::Models::EmailSendRawResponse::Data::Status::TaggedSymbol
            )
          SENT =
            T.let(
              :sent,
              ArkEmail::Models::EmailSendRawResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::EmailSendRawResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
