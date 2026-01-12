# typed: strong

module Ark
  module Models
    class EmailSendBatchResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailSendBatchResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::EmailSendBatchResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::EmailSendBatchResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::EmailSendBatchResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::EmailSendBatchResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::EmailSendBatchResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::EmailSendBatchResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::EmailSendBatchResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::EmailSendBatchResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Successfully accepted emails
        sig { returns(Integer) }
        attr_accessor :accepted

        # Failed emails
        sig { returns(Integer) }
        attr_accessor :failed

        # Map of recipient email to message info
        sig do
          returns(
            T::Hash[Symbol, Ark::Models::EmailSendBatchResponse::Data::Message]
          )
        end
        attr_accessor :messages

        # Total emails in the batch
        sig { returns(Integer) }
        attr_accessor :total

        sig do
          params(
            accepted: Integer,
            failed: Integer,
            messages:
              T::Hash[
                Symbol,
                Ark::Models::EmailSendBatchResponse::Data::Message::OrHash
              ],
            total: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Successfully accepted emails
          accepted:,
          # Failed emails
          failed:,
          # Map of recipient email to message info
          messages:,
          # Total emails in the batch
          total:
        )
        end

        sig do
          override.returns(
            {
              accepted: Integer,
              failed: Integer,
              messages:
                T::Hash[
                  Symbol,
                  Ark::Models::EmailSendBatchResponse::Data::Message
                ],
              total: Integer
            }
          )
        end
        def to_hash
        end

        class Message < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::EmailSendBatchResponse::Data::Message,
                Ark::Internal::AnyHash
              )
            end

          # Message ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :token

          sig { params(id: String, token: String).returns(T.attached_class) }
          def self.new(
            # Message ID
            id:,
            token:
          )
          end

          sig { override.returns({ id: String, token: String }) }
          def to_hash
          end
        end
      end

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::EmailSendBatchResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::EmailSendBatchResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::EmailSendBatchResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
