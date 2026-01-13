# frozen_string_literal: true

module Ark
  module Resources
    class Emails
      # Some parameter documentations has been truncated, see
      # {Ark::Models::EmailRetrieveParams} for more details.
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
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailRetrieveResponse]
      #
      # @see Ark::Models::EmailRetrieveParams
      def retrieve(email_id, params = {})
        parsed, options = Ark::EmailRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["emails/%1$s", email_id],
          query: parsed,
          model: Ark::Models::EmailRetrieveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Ark::Models::EmailListParams} for more details.
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
      # @param status [Symbol, Ark::Models::EmailListParams::Status] Filter by delivery status:
      #
      # @param tag [String] Filter by tag
      #
      # @param to [String] Filter by recipient email address
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailListResponse]
      #
      # @see Ark::Models::EmailListParams
      def list(params = {})
        parsed, options = Ark::EmailListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "emails",
          query: parsed.transform_keys(per_page: "perPage"),
          model: Ark::Models::EmailListResponse,
          options: options
        )
      end

      # Get the history of delivery attempts for an email, including SMTP response codes
      # and timestamps.
      #
      # @overload retrieve_deliveries(email_id, request_options: {})
      #
      # @param email_id [String]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailRetrieveDeliveriesResponse]
      #
      # @see Ark::Models::EmailRetrieveDeliveriesParams
      def retrieve_deliveries(email_id, params = {})
        @client.request(
          method: :get,
          path: ["emails/%1$s/deliveries", email_id],
          model: Ark::Models::EmailRetrieveDeliveriesResponse,
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
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailRetryResponse]
      #
      # @see Ark::Models::EmailRetryParams
      def retry_(email_id, params = {})
        @client.request(
          method: :post,
          path: ["emails/%1$s/retry", email_id],
          model: Ark::Models::EmailRetryResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Ark::Models::EmailSendParams} for more details.
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
      # @overload send_(from:, subject:, to:, attachments: nil, bcc: nil, cc: nil, headers: nil, html: nil, reply_to: nil, tag: nil, text: nil, idempotency_key: nil, request_options: {})
      #
      # @param from [String] Body param: Sender email address. Must be from a verified domain.
      #
      # @param subject [String] Body param: Email subject line
      #
      # @param to [Array<String>] Body param: Recipient email addresses (max 50)
      #
      # @param attachments [Array<Ark::Models::EmailSendParams::Attachment>] Body param: File attachments
      #
      # @param bcc [Array<String>] Body param: BCC recipients
      #
      # @param cc [Array<String>] Body param: CC recipients
      #
      # @param headers [Hash{Symbol=>String}] Body param: Custom email headers
      #
      # @param html [String] Body param: HTML body content.
      #
      # @param reply_to [String] Body param: Reply-to address
      #
      # @param tag [String] Body param: Tag for categorization and filtering
      #
      # @param text [String] Body param: Plain text body (auto-generated from HTML if not provided).
      #
      # @param idempotency_key [String] Header param: Unique key for idempotent requests. If a request with this key was
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailSendResponse]
      #
      # @see Ark::Models::EmailSendParams
      def send_(params)
        parsed, options = Ark::EmailSendParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "emails",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Ark::Models::EmailSendResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Ark::Models::EmailSendBatchParams} for more details.
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
      # @param emails [Array<Ark::Models::EmailSendBatchParams::Email>] Body param:
      #
      # @param from [String] Body param: Sender email for all messages
      #
      # @param idempotency_key [String] Header param: Unique key for idempotent requests. If a request with this key was
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailSendBatchResponse]
      #
      # @see Ark::Models::EmailSendBatchParams
      def send_batch(params)
        parsed, options = Ark::EmailSendBatchParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "emails/batch",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Ark::Models::EmailSendBatchResponse,
          options: options
        )
      end

      # Send a pre-formatted RFC 2822 MIME message. Use this for advanced use cases or
      # when migrating from systems that generate raw email content.
      #
      # The `data` field should contain the base64-encoded raw email.
      #
      # @overload send_raw(data:, mail_from:, rcpt_to:, request_options: {})
      #
      # @param data [String] Base64-encoded RFC 2822 message
      #
      # @param mail_from [String] Envelope sender address
      #
      # @param rcpt_to [Array<String>] Envelope recipient addresses
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::EmailSendRawResponse]
      #
      # @see Ark::Models::EmailSendRawParams
      def send_raw(params)
        parsed, options = Ark::EmailSendRawParams.dump_request(params)
        @client.request(
          method: :post,
          path: "emails/raw",
          body: parsed,
          model: Ark::Models::EmailSendRawResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Ark::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
