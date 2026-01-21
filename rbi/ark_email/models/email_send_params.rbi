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

      # Sender email address. Must be from a verified domain OR use sandbox mode.
      #
      # **Supported formats:**
      #
      # - Email only: `hello@yourdomain.com`
      # - With display name: `Acme <hello@yourdomain.com>`
      # - With quoted name: `"Acme Support" <support@yourdomain.com>`
      #
      # The domain portion must match a verified sending domain in your account.
      #
      # **Sandbox mode:** Use `sandbox@arkhq.io` to send test emails without domain
      # verification. Sandbox emails can only be sent to organization members and are
      # limited to 10 per day.
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

      # Custom email headers (accepts null)
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :headers

      # HTML body content (accepts null). Maximum 5MB (5,242,880 characters). Combined
      # with attachments, the total message must not exceed 14MB.
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

      # Reply-to address (accepts null)
      sig { returns(T.nilable(String)) }
      attr_accessor :reply_to

      # Tag for categorization and filtering (accepts null)
      sig { returns(T.nilable(String)) }
      attr_accessor :tag

      # Plain text body (accepts null, auto-generated from HTML if not provided).
      # Maximum 5MB (5,242,880 characters).
      sig { returns(T.nilable(String)) }
      attr_accessor :text

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
          headers: T.nilable(T::Hash[Symbol, String]),
          html: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, String]),
          reply_to: T.nilable(String),
          tag: T.nilable(String),
          text: T.nilable(String),
          idempotency_key: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Sender email address. Must be from a verified domain OR use sandbox mode.
        #
        # **Supported formats:**
        #
        # - Email only: `hello@yourdomain.com`
        # - With display name: `Acme <hello@yourdomain.com>`
        # - With quoted name: `"Acme Support" <support@yourdomain.com>`
        #
        # The domain portion must match a verified sending domain in your account.
        #
        # **Sandbox mode:** Use `sandbox@arkhq.io` to send test emails without domain
        # verification. Sandbox emails can only be sent to organization members and are
        # limited to 10 per day.
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
        # Custom email headers (accepts null)
        headers: nil,
        # HTML body content (accepts null). Maximum 5MB (5,242,880 characters). Combined
        # with attachments, the total message must not exceed 14MB.
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
        # Reply-to address (accepts null)
        reply_to: nil,
        # Tag for categorization and filtering (accepts null)
        tag: nil,
        # Plain text body (accepts null, auto-generated from HTML if not provided).
        # Maximum 5MB (5,242,880 characters).
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
            headers: T.nilable(T::Hash[Symbol, String]),
            html: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, String]),
            reply_to: T.nilable(String),
            tag: T.nilable(String),
            text: T.nilable(String),
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
