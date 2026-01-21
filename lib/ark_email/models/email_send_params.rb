# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_
    class EmailSendParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute from
      #   Sender email address. Must be from a verified domain OR use sandbox mode.
      #
      #   **Supported formats:**
      #
      #   - Email only: `hello@yourdomain.com`
      #   - With display name: `Acme <hello@yourdomain.com>`
      #   - With quoted name: `"Acme Support" <support@yourdomain.com>`
      #
      #   The domain portion must match a verified sending domain in your account.
      #
      #   **Sandbox mode:** Use `sandbox@arkhq.io` to send test emails without domain
      #   verification. Sandbox emails can only be sent to organization members and are
      #   limited to 10 per day.
      #
      #   @return [String]
      required :from, String

      # @!attribute subject
      #   Email subject line
      #
      #   @return [String]
      required :subject, String

      # @!attribute to
      #   Recipient email addresses (max 50)
      #
      #   @return [Array<String>]
      required :to, ArkEmail::Internal::Type::ArrayOf[String]

      # @!attribute attachments
      #   File attachments (accepts null)
      #
      #   @return [Array<ArkEmail::Models::EmailSendParams::Attachment>, nil]
      optional :attachments,
               -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::EmailSendParams::Attachment] },
               nil?: true

      # @!attribute bcc
      #   BCC recipients (accepts null)
      #
      #   @return [Array<String>, nil]
      optional :bcc, ArkEmail::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute cc
      #   CC recipients (accepts null)
      #
      #   @return [Array<String>, nil]
      optional :cc, ArkEmail::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute headers
      #   Custom email headers (accepts null)
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ArkEmail::Internal::Type::HashOf[String], nil?: true

      # @!attribute html
      #   HTML body content (accepts null). Maximum 5MB (5,242,880 characters). Combined
      #   with attachments, the total message must not exceed 14MB.
      #
      #   @return [String, nil]
      optional :html, String, nil?: true

      # @!attribute metadata
      #   Custom key-value pairs attached to an email for webhook correlation.
      #
      #   When you send an email with metadata, these key-value pairs are:
      #
      #   - **Stored** with the message
      #   - **Returned** in all webhook event payloads (MessageSent, MessageBounced, etc.)
      #   - **Never visible** to email recipients
      #
      #   This is useful for correlating webhook events with your internal systems (e.g.,
      #   user IDs, order IDs, campaign identifiers).
      #
      #   **Validation Rules:**
      #
      #   - Maximum 10 keys per email
      #   - Keys: 1-40 characters, must start with a letter, only alphanumeric and
      #     underscores (`^[a-zA-Z][a-zA-Z0-9_]*$`)
      #   - Values: 1-500 characters, no control characters (newlines, tabs, etc.)
      #   - Total size: 4KB maximum (JSON-encoded)
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, ArkEmail::Internal::Type::HashOf[String], nil?: true

      # @!attribute reply_to
      #   Reply-to address (accepts null)
      #
      #   @return [String, nil]
      optional :reply_to, String, api_name: :replyTo, nil?: true

      # @!attribute tag
      #   Tag for categorization and filtering (accepts null)
      #
      #   @return [String, nil]
      optional :tag, String, nil?: true

      # @!attribute text
      #   Plain text body (accepts null, auto-generated from HTML if not provided).
      #   Maximum 5MB (5,242,880 characters).
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(from:, subject:, to:, attachments: nil, bcc: nil, cc: nil, headers: nil, html: nil, metadata: nil, reply_to: nil, tag: nil, text: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::EmailSendParams} for more details.
      #
      #   @param from [String] Sender email address. Must be from a verified domain OR use sandbox mode.
      #
      #   @param subject [String] Email subject line
      #
      #   @param to [Array<String>] Recipient email addresses (max 50)
      #
      #   @param attachments [Array<ArkEmail::Models::EmailSendParams::Attachment>, nil] File attachments (accepts null)
      #
      #   @param bcc [Array<String>, nil] BCC recipients (accepts null)
      #
      #   @param cc [Array<String>, nil] CC recipients (accepts null)
      #
      #   @param headers [Hash{Symbol=>String}, nil] Custom email headers (accepts null)
      #
      #   @param html [String, nil] HTML body content (accepts null).
      #
      #   @param metadata [Hash{Symbol=>String}, nil] Custom key-value pairs attached to an email for webhook correlation.
      #
      #   @param reply_to [String, nil] Reply-to address (accepts null)
      #
      #   @param tag [String, nil] Tag for categorization and filtering (accepts null)
      #
      #   @param text [String, nil] Plain text body (accepts null, auto-generated from HTML if not provided).
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      class Attachment < ArkEmail::Internal::Type::BaseModel
        # @!attribute content
        #   Base64-encoded file content
        #
        #   @return [String]
        required :content, String

        # @!attribute content_type
        #   MIME type
        #
        #   @return [String]
        required :content_type, String, api_name: :contentType

        # @!attribute filename
        #   Attachment filename
        #
        #   @return [String]
        required :filename, String

        # @!method initialize(content:, content_type:, filename:)
        #   @param content [String] Base64-encoded file content
        #
        #   @param content_type [String] MIME type
        #
        #   @param filename [String] Attachment filename
      end
    end
  end
end
