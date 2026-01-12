# typed: strong

module Ark
  module Resources
    class Emails
      # Retrieve detailed information about a specific email including delivery status,
      # timestamps, and optionally the email content.
      #
      # Use the `expand` parameter to include additional data like the HTML/text body,
      # headers, or delivery attempts.
      sig do
        params(
          email_id: String,
          expand: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::EmailRetrieveResponse)
      end
      def retrieve(
        # The email ID (from send response) or message token
        email_id,
        # Comma-separated list of fields to include:
        #
        # - `content` - HTML and plain text body
        # - `headers` - Email headers
        # - `deliveries` - Delivery attempt history
        # - `activity` - Opens and clicks
        expand: nil,
        request_options: {}
      )
      end

      # Retrieve a paginated list of sent emails. Results are ordered by send time,
      # newest first.
      #
      # Use filters to narrow down results by status, recipient, sender, or tag.
      #
      # **Related endpoints:**
      #
      # - `GET /emails/{id}` - Get full details of a specific email
      # - `POST /emails` - Send a new email
      sig do
        params(
          after: String,
          before: String,
          from: String,
          page: Integer,
          per_page: Integer,
          status: Ark::EmailListParams::Status::OrSymbol,
          tag: String,
          to: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::EmailListResponse)
      end
      def list(
        # Return emails sent after this timestamp (Unix seconds or ISO 8601)
        after: nil,
        # Return emails sent before this timestamp
        before: nil,
        # Filter by sender email address
        from: nil,
        # Page number (starts at 1)
        page: nil,
        # Results per page (max 100)
        per_page: nil,
        # Filter by delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        status: nil,
        # Filter by tag
        tag: nil,
        # Filter by recipient email address
        to: nil,
        request_options: {}
      )
      end

      # Get the history of delivery attempts for an email, including SMTP response codes
      # and timestamps.
      sig do
        params(
          email_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::EmailGetDeliveriesResponse)
      end
      def get_deliveries(email_id, request_options: {})
      end

      # Retry delivery of a failed or soft-bounced email. Creates a new delivery
      # attempt.
      #
      # Only works for emails that have failed or are in a retryable state.
      sig do
        params(
          email_id: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::EmailRetryResponse)
      end
      def retry_(email_id, request_options: {})
      end

      # Send a single email message. The email is accepted for immediate delivery and
      # typically delivered within seconds.
      #
      # **Example use case:** Send a password reset email to a user.
      #
      # **Required fields:** `from`, `to`, `subject`, and either `html` or `text`
      #
      # **Idempotency:** Supports `Idempotency-Key` header for safe retries.
      #
      # **Related endpoints:**
      #
      # - `GET /emails/{id}` - Track delivery status
      # - `GET /emails/{id}/deliveries` - View delivery attempts
      # - `POST /emails/{id}/retry` - Retry failed delivery
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
        ).returns(Ark::SendEmail)
      end
      def send_(
        # Body param: Sender email address. Must be from a verified domain.
        #
        # **Supported formats:**
        #
        # - Email only: `hello@yourdomain.com`
        # - With display name: `Acme <hello@yourdomain.com>`
        # - With quoted name: `"Acme Support" <support@yourdomain.com>`
        #
        # The domain portion must match a verified sending domain in your account.
        from:,
        # Body param: Email subject line
        subject:,
        # Body param: Recipient email addresses (max 50)
        to:,
        # Body param: File attachments
        attachments: nil,
        # Body param: BCC recipients
        bcc: nil,
        # Body param: CC recipients
        cc: nil,
        # Body param: Custom email headers
        headers: nil,
        # Body param: HTML body content. Maximum 5MB (5,242,880 characters). Combined with
        # attachments, the total message must not exceed 14MB.
        html: nil,
        # Body param: Reply-to address
        reply_to: nil,
        # Body param: Tag for categorization and filtering
        tag: nil,
        # Body param: Plain text body (auto-generated from HTML if not provided). Maximum
        # 5MB (5,242,880 characters).
        text: nil,
        # Header param: Unique key for idempotent requests. If a request with this key was
        # already processed, the cached response is returned. Keys expire after 24 hours.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Send up to 100 emails in a single request. Useful for sending personalized
      # emails to multiple recipients efficiently.
      #
      # Each email in the batch can have different content and recipients. Failed emails
      # don't affect other emails in the batch.
      #
      # **Idempotency:** Supports `Idempotency-Key` header for safe retries.
      sig do
        params(
          emails: T::Array[Ark::EmailSendBatchParams::Email::OrHash],
          from: String,
          idempotency_key: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::EmailSendBatchResponse)
      end
      def send_batch(
        # Body param:
        emails:,
        # Body param: Sender email for all messages
        from:,
        # Header param: Unique key for idempotent requests. If a request with this key was
        # already processed, the cached response is returned. Keys expire after 24 hours.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Send a pre-formatted RFC 2822 MIME message. Use this for advanced use cases or
      # when migrating from systems that generate raw email content.
      #
      # The `data` field should contain the base64-encoded raw email.
      sig do
        params(
          data: String,
          mail_from: String,
          rcpt_to: T::Array[String],
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::SendEmail)
      end
      def send_raw(
        # Base64-encoded RFC 2822 message
        data:,
        # Envelope sender address
        mail_from:,
        # Envelope recipient addresses
        rcpt_to:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Ark::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
