# typed: strong

module ArkEmail
  module Models
    class EmailSendParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailSendParams, ArkEmail::Internal::AnyHash)
        end

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

      # File attachments (accepts null)
      sig do
        returns(T.nilable(T::Array[ArkEmail::EmailSendParams::Attachment]))
      end
      attr_accessor :attachments

      # BCC recipients (accepts null)
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :bcc

      # CC recipients (accepts null)
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :cc

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

      # Reply-to address (accepts null)
      sig { returns(T.nilable(String)) }
      attr_accessor :reply_to

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
          attachments:
            T.nilable(T::Array[ArkEmail::EmailSendParams::Attachment::OrHash]),
          bcc: T.nilable(T::Array[String]),
          cc: T.nilable(T::Array[String]),
          headers: T::Hash[Symbol, String],
          html: String,
          reply_to: T.nilable(String),
          tag: String,
          text: String,
          idempotency_key: String,
          request_options: ArkEmail::RequestOptions::OrHash
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
        # File attachments (accepts null)
        attachments: nil,
        # BCC recipients (accepts null)
        bcc: nil,
        # CC recipients (accepts null)
        cc: nil,
        # Custom email headers
        headers: nil,
        # HTML body content. Maximum 5MB (5,242,880 characters). Combined with
        # attachments, the total message must not exceed 14MB.
        html: nil,
        # Reply-to address (accepts null)
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
            attachments:
              T.nilable(T::Array[ArkEmail::EmailSendParams::Attachment]),
            bcc: T.nilable(T::Array[String]),
            cc: T.nilable(T::Array[String]),
            headers: T::Hash[Symbol, String],
            html: String,
            reply_to: T.nilable(String),
            tag: String,
            text: String,
            idempotency_key: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Attachment < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::EmailSendParams::Attachment,
              ArkEmail::Internal::AnyHash
            )
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
