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
      # @param email_id [String] The email ID (from send response) or message token
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
      # - `GET /emails/{id}` - Get full details of a specific email
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

      # Get the history of delivery attempts for an email, including SMTP response codes
      # and timestamps.
      #
      # @overload retrieve_deliveries(email_id, request_options: {})
      #
      # @param email_id [String]
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
      # @param email_id [String]
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
      # - `GET /emails/{id}` - Track delivery status
      # - `GET /emails/{id}/deliveries` - View delivery attempts
      # - `POST /emails/{id}/retry` - Retry failed delivery
      #
      # @overload send_(from:, subject:, to:, attachments: nil, bcc: nil, cc: nil, headers: nil, html: nil, metadata: nil, reply_to: nil, tag: nil, text: nil, idempotency_key: nil, request_options: {})
      #
      # @param from [String] Body param: Sender email address. Must be from a verified domain.
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
      # @overload send_batch(emails:, from:, idempotency_key: nil, request_options: {})
      #
      # @param emails [Array<ArkEmail::Models::EmailSendBatchParams::Email>] Body param
      #
      # @param from [String] Body param: Sender email for all messages
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

      # Send a pre-formatted RFC 2822 MIME message. Use this for advanced use cases or
      # when migrating from systems that generate raw email content.
      #
      # The `data` field should contain the base64-encoded raw email.
      #
      # @overload send_raw(data:, mail_from:, rcpt_to:, bounce: nil, request_options: {})
      #
      # @param data [String] Base64-encoded RFC 2822 message
      #
      # @param mail_from [String] Envelope sender address
      #
      # @param rcpt_to [Array<String>] Envelope recipient addresses
      #
      # @param bounce [Boolean, nil] Whether this is a bounce message (accepts null)
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
