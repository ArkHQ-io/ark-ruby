# typed: strong

module Ark
  module Models
    class EmailSendParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(Ark::EmailSendParams, Ark::Internal::AnyHash) }

      # Sender email address. Must be from a verified domain.
      #
      # **Supported formats:**
      #
      # - Email only: `hello@yourdomain.com`
      # - With display name: `Acme <hello@yourdomain.com>`
      # - With quoted name: `"Acme Support" <support@yourdomain.com>`
      #
      # The domain portion must match a verified sending domain in your account.
      sig { returns(String) }
      attr_accessor :from

      # Email subject line
      sig { returns(String) }
      attr_accessor :subject

      # Recipient email addresses (max 50)
      sig { returns(T::Array[String]) }
      attr_accessor :to

      # File attachments
      sig { returns(T.nilable(T::Array[Ark::EmailSendParams::Attachment])) }
      attr_reader :attachments

      sig do
        params(
          attachments: T::Array[Ark::EmailSendParams::Attachment::OrHash]
        ).void
      end
      attr_writer :attachments

      # BCC recipients
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :bcc

      sig { params(bcc: T::Array[String]).void }
      attr_writer :bcc

      # CC recipients
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :cc

      sig { params(cc: T::Array[String]).void }
      attr_writer :cc

      # Custom email headers
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # HTML body content. Maximum 5MB (5,242,880 characters). Combined with
      # attachments, the total message must not exceed 14MB.
      sig { returns(T.nilable(String)) }
      attr_reader :html

      sig { params(html: String).void }
      attr_writer :html

      # Reply-to address
      sig { returns(T.nilable(String)) }
      attr_reader :reply_to

      sig { params(reply_to: String).void }
      attr_writer :reply_to

      # Tag for categorization and filtering
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      # Plain text body (auto-generated from HTML if not provided). Maximum 5MB
      # (5,242,880 characters).
      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          from: String,
          subject: String,
          to: T::Array[String],
          attachments: T::Array[Ark::EmailSendParams::Attachment::OrHash],
          bcc: T::Array[String],
          cc: T::Array[String],
          headers: T::Hash[Symbol, String],
          html: String,
          reply_to: String,
          tag: String,
          text: String,
          idempotency_key: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Sender email address. Must be from a verified domain.
        #
        # **Supported formats:**
        #
        # - Email only: `hello@yourdomain.com`
        # - With display name: `Acme <hello@yourdomain.com>`
        # - With quoted name: `"Acme Support" <support@yourdomain.com>`
        #
        # The domain portion must match a verified sending domain in your account.
        from:,
        # Email subject line
        subject:,
        # Recipient email addresses (max 50)
        to:,
        # File attachments
        attachments: nil,
        # BCC recipients
        bcc: nil,
        # CC recipients
        cc: nil,
        # Custom email headers
        headers: nil,
        # HTML body content. Maximum 5MB (5,242,880 characters). Combined with
        # attachments, the total message must not exceed 14MB.
        html: nil,
        # Reply-to address
        reply_to: nil,
        # Tag for categorization and filtering
        tag: nil,
        # Plain text body (auto-generated from HTML if not provided). Maximum 5MB
        # (5,242,880 characters).
        text: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            from: String,
            subject: String,
            to: T::Array[String],
            attachments: T::Array[Ark::EmailSendParams::Attachment],
            bcc: T::Array[String],
            cc: T::Array[String],
            headers: T::Hash[Symbol, String],
            html: String,
            reply_to: String,
            tag: String,
            text: String,
            idempotency_key: String,
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Attachment < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Ark::EmailSendParams::Attachment, Ark::Internal::AnyHash)
          end

        # Base64-encoded file content
        sig { returns(String) }
        attr_accessor :content

        # MIME type
        sig { returns(String) }
        attr_accessor :content_type

        # Attachment filename
        sig { returns(String) }
        attr_accessor :filename

        sig do
          params(
            content: String,
            content_type: String,
            filename: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Base64-encoded file content
          content:,
          # MIME type
          content_type:,
          # Attachment filename
          filename:
        )
        end

        sig do
          override.returns(
            { content: String, content_type: String, filename: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
