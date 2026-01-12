# typed: strong

module Ark
  module Models
    class EmailSendBatchParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Ark::EmailSendBatchParams, Ark::Internal::AnyHash)
        end

      sig { returns(T::Array[Ark::EmailSendBatchParams::Email]) }
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
          emails: T::Array[Ark::EmailSendBatchParams::Email::OrHash],
          from: String,
          idempotency_key: String,
          request_options: Ark::RequestOptions::OrHash
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
            emails: T::Array[Ark::EmailSendBatchParams::Email],
            from: String,
            idempotency_key: String,
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Email < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Ark::EmailSendBatchParams::Email, Ark::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :subject

        sig { returns(T::Array[String]) }
        attr_accessor :to

        sig { returns(T.nilable(String)) }
        attr_reader :html

        sig { params(html: String).void }
        attr_writer :html

        sig { returns(T.nilable(String)) }
        attr_reader :tag

        sig { params(tag: String).void }
        attr_writer :tag

        sig { returns(T.nilable(String)) }
        attr_reader :text

        sig { params(text: String).void }
        attr_writer :text

        sig do
          params(
            subject: String,
            to: T::Array[String],
            html: String,
            tag: String,
            text: String
          ).returns(T.attached_class)
        end
        def self.new(subject:, to:, html: nil, tag: nil, text: nil)
        end

        sig do
          override.returns(
            {
              subject: String,
              to: T::Array[String],
              html: String,
              tag: String,
              text: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
