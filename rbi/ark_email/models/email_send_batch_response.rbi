# typed: strong

module ArkEmail
  module Models
    class EmailSendBatchResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::EmailSendBatchResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::EmailSendBatchResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: ArkEmail::Models::EmailSendBatchResponse::Data::OrHash
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
          data: ArkEmail::Models::EmailSendBatchResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::EmailSendBatchResponse::Data,
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
              ArkEmail::Models::EmailSendBatchResponse::Data,
              ArkEmail::Internal::AnyHash
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
            T::Hash[
              Symbol,
              ArkEmail::Models::EmailSendBatchResponse::Data::Message
            ]
          )
        end
        attr_accessor :messages

        # The tenant ID this batch was sent from
        sig { returns(String) }
        attr_accessor :tenant_id

        # Total emails in the batch
        sig { returns(Integer) }
        attr_accessor :total

        # Whether this batch was sent in sandbox mode. Only present (and true) for sandbox
        # emails sent from @arkhq.io addresses.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        sig do
          params(
            accepted: Integer,
            failed: Integer,
            messages:
              T::Hash[
                Symbol,
                ArkEmail::Models::EmailSendBatchResponse::Data::Message::OrHash
              ],
            tenant_id: String,
            total: Integer,
            sandbox: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Successfully accepted emails
          accepted:,
          # Failed emails
          failed:,
          # Map of recipient email to message info
          messages:,
          # The tenant ID this batch was sent from
          tenant_id:,
          # Total emails in the batch
          total:,
          # Whether this batch was sent in sandbox mode. Only present (and true) for sandbox
          # emails sent from @arkhq.io addresses.
          sandbox: nil
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
                  ArkEmail::Models::EmailSendBatchResponse::Data::Message
                ],
              tenant_id: String,
              total: Integer,
              sandbox: T::Boolean
            }
          )
        end
        def to_hash
        end

        class Message < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::EmailSendBatchResponse::Data::Message,
                ArkEmail::Internal::AnyHash
              )
            end

          # Message identifier (token)
          sig { returns(String) }
          attr_accessor :id

          sig { params(id: String).returns(T.attached_class) }
          def self.new(
            # Message identifier (token)
            id:
          )
          end

          sig { override.returns({ id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
