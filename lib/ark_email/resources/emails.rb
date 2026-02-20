# frozen_string_literal: true

module ArkEmail
  module Resources
    class Emails
      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::EmailRetrieveParams} for more details.
      #
      # Retrieve detailed information about a specific email including delivery status,
      # timestamps, and optionally the email content.
      #
      # Use the `expand` parameter to include additional data like the HTML/text body,
      # headers, or delivery attempts.
      #
      # @overload retrieve(email_id, expand: nil, request_options: {})
      #
      # @param email_id [String] The email identifier (token returned from send response)
      #
      # @param expand [String] Comma-separated list of fields to include:
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::EmailRetrieveResponse]
      #
      # @see ArkEmail::Models::EmailRetrieveParams
      def retrieve(email_id, params = {})
        parsed, options = ArkEmail::EmailRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["emails/%1$s", email_id],
          query: parsed,
          model: ArkEmail::Models::EmailRetrieveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::EmailListParams} for more details.
      #
      # Retrieve a paginated list of sent emails. Results are ordered by send time,
      # newest first.
      #
      # Use filters to narrow down results by status, recipient, sender, or tag.
      #
      # **Related endpoints:**
      #
      # - `GET /emails/{emailId}` - Get full details of a specific email
      # - `POST /emails` - Send a new email
      #
      # @overload list(after: nil, before: nil, from: nil, page: nil, per_page: nil, status: nil, tag: nil, to: nil, request_options: {})
      #
      # @param after [String] Return emails sent after this timestamp (Unix seconds or ISO 8601)
      #
      # @param before [String] Return emails sent before this timestamp
      #
      # @param from [String] Filter by sender email address
      #
      # @param page [Integer] Page number (starts at 1)
      #
      # @param per_page [Integer] Results per page (max 100)
      #
      # @param status [Symbol, ArkEmail::Models::EmailListParams::Status] Filter by delivery status:
      #
      # @param tag [String] Filter by tag
      #
      # @param to [String] Filter by recipient email address
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::EmailListResponse>]
      #
      # @see ArkEmail::Models::EmailListParams
      def list(params = {})
        parsed, options = ArkEmail::EmailListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "emails",
          query: parsed.transform_keys(per_page: "perPage"),
          page: ArkEmail::Internal::PageNumberPagination,
          model: ArkEmail::Models::EmailListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::EmailRetrieveDeliveriesParams} for more details.
      #
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
      #
      # @overload retrieve_deliveries(email_id, request_options: {})
      #
      # @param email_id [String] Email identifier (the token returned when sending an email).
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::EmailRetrieveDeliveriesResponse]
      #
      # @see ArkEmail::Models::EmailRetrieveDeliveriesParams
      def retrieve_deliveries(email_id, params = {})
        @client.request(
          method: :get,
          path: ["emails/%1$s/deliveries", email_id],
          model: ArkEmail::Models::EmailRetrieveDeliveriesResponse,
          options: params[:request_options]
        )
      end

      # Retry delivery of a failed or soft-bounced email. Creates a new delivery
      # attempt.
      #
      # Only works for emails that have failed or are in a retryable state.
      #
      # @overload retry_(email_id, request_options: {})
      #
      # @param email_id [String] The email identifier (token returned from send response)
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::EmailRetryResponse]
      #
      # @see ArkEmail::Models::EmailRetryParams
      def retry_(email_id, params = {})
        @client.request(
          method: :post,
          path: ["emails/%1$s/retry", email_id],
          model: ArkEmail::Models::EmailRetryResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::EmailSendParams} for more details.
      #
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
      # - `GET /emails/{emailId}` - Track delivery status
      # - `GET /emails/{emailId}/deliveries` - View delivery attempts
      # - `POST /emails/{emailId}/retry` - Retry failed delivery
      #
      # @overload send_(from:, subject:, to:, attachments: nil, bcc: nil, cc: nil, headers: nil, html: nil, metadata: nil, reply_to: nil, tag: nil, tenant_id: nil, text: nil, idempotency_key: nil, request_options: {})
      #
      # @param from [String] Body param: Sender email address. Must be from a verified domain OR use sandbox
      #
      # @param subject [String] Body param: Email subject line
      #
      # @param to [Array<String>] Body param: Recipient email addresses (max 50)
      #
      # @param attachments [Array<ArkEmail::Models::EmailSendParams::Attachment>, nil] Body param: File attachments (accepts null)
      #
      # @param bcc [Array<String>, nil] Body param: BCC recipients (accepts null)
      #
      # @param cc [Array<String>, nil] Body param: CC recipients (accepts null)
      #
      # @param headers [Hash{Symbol=>String}, nil] Body param: Custom email headers (accepts null)
      #
      # @param html [String, nil] Body param: HTML body content (accepts null).
      #
      # @param metadata [Hash{Symbol=>String}, nil] Body param: Custom key-value pairs attached to an email for webhook correlation.
      #
      # @param reply_to [String, nil] Body param: Reply-to address (accepts null)
      #
      # @param tag [String, nil] Body param: Tag for categorization and filtering (accepts null)
      #
      # @param tenant_id [String, nil] Body param: The tenant ID to send this email from. Determines which tenant's
      #
      # @param text [String, nil] Body param: Plain text body (accepts null, auto-generated from HTML if not provi
      #
      # @param idempotency_key [String] Header param: Unique key for idempotent requests. If a request with this key was
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::EmailSendResponse]
      #
      # @see ArkEmail::Models::EmailSendParams
      def send_(params)
        parsed, options = ArkEmail::EmailSendParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "emails",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: ArkEmail::Models::EmailSendResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::EmailSendBatchParams} for more details.
      #
      # Send up to 100 emails in a single request. Useful for sending personalized
      # emails to multiple recipients efficiently.
      #
      # Each email in the batch can have different content and recipients. Failed emails
      # don't affect other emails in the batch.
      #
      # **Idempotency:** Supports `Idempotency-Key` header for safe retries.
      #
      # @overload send_batch(emails:, from:, tenant_id: nil, idempotency_key: nil, request_options: {})
      #
      # @param emails [Array<ArkEmail::Models::EmailSendBatchParams::Email>] Body param
      #
      # @param from [String] Body param: Sender email for all messages
      #
      # @param tenant_id [String, nil] Body param: The tenant ID to send this batch from. Determines which tenant's
      #
      # @param idempotency_key [String] Header param: Unique key for idempotent requests. If a request with this key was
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::EmailSendBatchResponse]
      #
      # @see ArkEmail::Models::EmailSendBatchParams
      def send_batch(params)
        parsed, options = ArkEmail::EmailSendBatchParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "emails/batch",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: ArkEmail::Models::EmailSendBatchResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::EmailSendRawParams} for more details.
      #
      # Send a pre-formatted RFC 2822 MIME message. Use this for advanced use cases or
      # when migrating from systems that generate raw email content.
      #
      # **Important:** The `rawMessage` field must be base64-encoded. Your raw MIME
      # message (with headers like From, To, Subject, Content-Type, followed by a blank
      # line and the body) must be encoded to base64 before sending.
      #
      # @overload send_raw(from:, raw_message:, to:, bounce: nil, tenant_id: nil, request_options: {})
      #
      # @param from [String] Sender email address. Must be from a verified domain.
      #
      # @param raw_message [String] Base64-encoded RFC 2822 MIME message.
      #
      # @param to [Array<String>] Recipient email addresses
      #
      # @param bounce [Boolean, nil] Whether this is a bounce message (accepts null)
      #
      # @param tenant_id [String, nil] The tenant ID to send this email from. Determines which tenant's
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::EmailSendRawResponse]
      #
      # @see ArkEmail::Models::EmailSendRawParams
      def send_raw(params)
        parsed, options = ArkEmail::EmailSendRawParams.dump_request(params)
        @client.request(
          method: :post,
          path: "emails/raw",
          body: parsed,
          model: ArkEmail::Models::EmailSendRawResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ArkEmail::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
