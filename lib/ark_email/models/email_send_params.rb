# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#send_
    class EmailSendParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute from
      #   Sender email address. Must be from a verified domain.
      #
      #   **Supported formats:**
      #
      #   - Email only: `hello@yourdomain.com`
      #   - With display name: `Acme <hello@yourdomain.com>`
      #   - With quoted name: `"Acme Support" <support@yourdomain.com>`
      #
      #   The domain portion must match a verified sending domain in your account.
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
      #   Custom email headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, ArkEmail::Internal::Type::HashOf[String]

      # @!attribute html
      #   HTML body content. Maximum 5MB (5,242,880 characters). Combined with
      #   attachments, the total message must not exceed 14MB.
      #
      #   @return [String, nil]
      optional :html, String

      # @!attribute reply_to
      #   Reply-to address (accepts null)
      #
      #   @return [String, nil]
      optional :reply_to, String, api_name: :replyTo, nil?: true

      # @!attribute tag
      #   Tag for categorization and filtering
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute text
      #   Plain text body (auto-generated from HTML if not provided). Maximum 5MB
      #   (5,242,880 characters).
      #
      #   @return [String, nil]
      optional :text, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(from:, subject:, to:, attachments: nil, bcc: nil, cc: nil, headers: nil, html: nil, reply_to: nil, tag: nil, text: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::EmailSendParams} for more details.
      #
      #   @param from [String] Sender email address. Must be from a verified domain.
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
      #   @param headers [Hash{Symbol=>String}] Custom email headers
      #
      #   @param html [String] HTML body content.
      #
      #   @param reply_to [String, nil] Reply-to address (accepts null)
      #
      #   @param tag [String] Tag for categorization and filtering
      #
      #   @param text [String] Plain text body (auto-generated from HTML if not provided).
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
