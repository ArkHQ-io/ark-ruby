# typed: strong

module ArkEmail
  module Models
    class EmailSendBatchParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailSendBatchParams, ArkEmail::Internal::AnyHash)
        end

      sig { returns(T::Array[ArkEmail::EmailSendBatchParams::Email]) }
      attr_accessor :emails

      # Sender email for all messages
      sig { returns(String) }
      attr_accessor :from

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          emails: T::Array[ArkEmail::EmailSendBatchParams::Email::OrHash],
          from: String,
          idempotency_key: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        emails:,
        # Sender email for all messages
        from:,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            emails: T::Array[ArkEmail::EmailSendBatchParams::Email],
            from: String,
            idempotency_key: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Email < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::EmailSendBatchParams::Email,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :subject

        sig { returns(T::Array[String]) }
        attr_accessor :to

        sig { returns(T.nilable(String)) }
        attr_accessor :html

        # Custom key-value pairs attached to an email for webhook correlation.
        #
        # When you send an email with metadata, these key-value pairs are:
        #
        # - **Stored** with the message
        # - **Returned** in all webhook event payloads (MessageSent, MessageBounced, etc.)
        # - **Never visible** to email recipients
        #
        # This is useful for correlating webhook events with your internal systems (e.g.,
        # user IDs, order IDs, campaign identifiers).
        #
        # **Validation Rules:**
        #
        # - Maximum 10 keys per email
        # - Keys: 1-40 characters, must start with a letter, only alphanumeric and
        #   underscores (`^[a-zA-Z][a-zA-Z0-9_]*$`)
        # - Values: 1-500 characters, no control characters (newlines, tabs, etc.)
        # - Total size: 4KB maximum (JSON-encoded)
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :metadata

        # Tag for categorization and filtering
        sig { returns(T.nilable(String)) }
        attr_accessor :tag

        sig { returns(T.nilable(String)) }
        attr_accessor :text

        sig do
          params(
            subject: String,
            to: T::Array[String],
            html: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, String]),
            tag: T.nilable(String),
            text: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          subject:,
          to:,
          html: nil,
          # Custom key-value pairs attached to an email for webhook correlation.
          #
          # When you send an email with metadata, these key-value pairs are:
          #
          # - **Stored** with the message
          # - **Returned** in all webhook event payloads (MessageSent, MessageBounced, etc.)
          # - **Never visible** to email recipients
          #
          # This is useful for correlating webhook events with your internal systems (e.g.,
          # user IDs, order IDs, campaign identifiers).
          #
          # **Validation Rules:**
          #
          # - Maximum 10 keys per email
          # - Keys: 1-40 characters, must start with a letter, only alphanumeric and
          #   underscores (`^[a-zA-Z][a-zA-Z0-9_]*$`)
          # - Values: 1-500 characters, no control characters (newlines, tabs, etc.)
          # - Total size: 4KB maximum (JSON-encoded)
          metadata: nil,
          # Tag for categorization and filtering
          tag: nil,
          text: nil
        )
        end

        sig do
          override.returns(
            {
              subject: String,
              to: T::Array[String],
              html: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, String]),
              tag: T.nilable(String),
              text: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
