# typed: strong

module ArkEmail
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
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::EmailRetrieveResponse)
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
          status: ArkEmail::EmailListParams::Status::OrSymbol,
          tag: String,
          to: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(
          ArkEmail::Internal::PageNumberPagination[
            ArkEmail::Models::EmailListResponse
          ]
        )
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

      # Get the complete delivery history for an email, including SMTP response codes,
      # timestamps, and current retry state.
      #
      # ## Response Fields
      #
      # ### Status
      #
      # The current status of the email:
      #
      # - `pending` - Awaiting first delivery attempt
      # - `sent` - Successfully delivered to recipient server
      # - `softfail` - Temporary failure, automatic retry scheduled
      # - `hardfail` - Permanent failure, will not retry
      # - `held` - Held for manual review
      # - `bounced` - Bounced by recipient server
      #
      # ### Retry State
      #
      # When the email is in the delivery queue (`pending` or `softfail` status),
      # `retryState` provides information about the retry schedule:
      #
      # - `attempt` - Current attempt number (0 = first attempt)
      # - `maxAttempts` - Maximum attempts before hard-fail (typically 18)
      # - `attemptsRemaining` - Attempts left before hard-fail
      # - `nextRetryAt` - When the next retry is scheduled (Unix timestamp)
      # - `processing` - Whether the email is currently being processed
      # - `manual` - Whether this was triggered by a manual retry
      #
      # When the email has finished processing (`sent`, `hardfail`, `held`, `bounced`),
      # `retryState` is `null`.
      #
      # ### Can Retry Manually
      #
      # Indicates whether you can call `POST /emails/{emailId}/retry` to manually retry
      # the email. This is `true` when the raw message content is still available (not
      # expired due to retention policy).
      sig do
        params(
          email_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::EmailRetrieveDeliveriesResponse)
      end
      def retrieve_deliveries(
        # Email identifier. Accepts multiple formats:
        #
        # - Message ID (numeric): `12345`
        # - Message token: `aBc123XyZ`
        # - Combined format: `msg_12345_aBc123XyZ`
        email_id,
        request_options: {}
      )
      end

      # Retry delivery of a failed or soft-bounced email. Creates a new delivery
      # attempt.
      #
      # Only works for emails that have failed or are in a retryable state.
      sig do
        params(
          email_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::EmailRetryResponse)
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
        ).returns(ArkEmail::Models::EmailSendResponse)
      end
      def send_(
        # Body param: Sender email address. Must be from a verified domain OR use sandbox
        # mode.
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
        # Body param: Email subject line
        subject:,
        # Body param: Recipient email addresses (max 50)
        to:,
        # Body param: File attachments (accepts null)
        attachments: nil,
        # Body param: BCC recipients (accepts null)
        bcc: nil,
        # Body param: CC recipients (accepts null)
        cc: nil,
        # Body param: Custom email headers (accepts null)
        headers: nil,
        # Body param: HTML body content (accepts null). Maximum 5MB (5,242,880
        # characters). Combined with attachments, the total message must not exceed 14MB.
        html: nil,
        # Body param: Custom key-value pairs attached to an email for webhook correlation.
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
        # Body param: Reply-to address (accepts null)
        reply_to: nil,
        # Body param: Tag for categorization and filtering (accepts null)
        tag: nil,
        # Body param: Plain text body (accepts null, auto-generated from HTML if not
        # provided). Maximum 5MB (5,242,880 characters).
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
          emails: T::Array[ArkEmail::EmailSendBatchParams::Email::OrHash],
          from: String,
          idempotency_key: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::EmailSendBatchResponse)
      end
      def send_batch(
        # Body param
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
      # The `rawMessage` field should contain the base64-encoded raw email.
      sig do
        params(
          from: String,
          raw_message: String,
          to: T::Array[String],
          bounce: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::EmailSendRawResponse)
      end
      def send_raw(
        # Sender email address
        from:,
        # Base64-encoded RFC 2822 MIME message
        raw_message:,
        # Recipient email addresses
        to:,
        # Whether this is a bounce message (accepts null)
        bounce: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ArkEmail::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
