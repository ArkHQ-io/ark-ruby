# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#retrieve_deliveries
    class EmailRetrieveDeliveriesResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data]
      required :data, -> { ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::EmailRetrieveDeliveriesResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Message identifier (token)
        #
        #   @return [String]
        required :id, String

        # @!attribute can_retry_manually
        #   Whether the message can be manually retried via `POST /emails/{id}/retry`.
        #   `true` when the raw message content is still available (not expired). Messages
        #   older than the retention period cannot be retried.
        #
        #   @return [Boolean]
        required :can_retry_manually, ArkEmail::Internal::Type::Boolean, api_name: :canRetryManually

        # @!attribute deliveries
        #   Chronological list of delivery attempts for this message. Each attempt includes
        #   SMTP response codes and timestamps.
        #
        #   @return [Array<ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery>]
        required :deliveries,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery] }

        # @!attribute retry_state
        #   Information about the current retry state of a message that is queued for
        #   delivery. Only present when the message is in the delivery queue.
        #
        #   @return [ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState, nil]
        required :retry_state,
                 -> { ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState },
                 api_name: :retryState,
                 nil?: true

        # @!attribute status
        #   Current message status (lowercase). Possible values:
        #
        #   - `pending` - Initial state, awaiting first delivery attempt
        #   - `sent` - Successfully delivered
        #   - `softfail` - Temporary failure, will retry automatically
        #   - `hardfail` - Permanent failure, will not retry
        #   - `held` - Held for manual review (suppression list, etc.)
        #   - `bounced` - Bounced by recipient server
        #
        #   @return [Symbol, ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status]
        required :status, enum: -> { ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status }

        # @!method initialize(id:, can_retry_manually:, deliveries:, retry_state:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data} for more details.
        #
        #   @param id [String] Message identifier (token)
        #
        #   @param can_retry_manually [Boolean] Whether the message can be manually retried via `POST /emails/{id}/retry`.
        #
        #   @param deliveries [Array<ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery>] Chronological list of delivery attempts for this message.
        #
        #   @param retry_state [ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState, nil] Information about the current retry state of a message that is queued for delive
        #
        #   @param status [Symbol, ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status] Current message status (lowercase). Possible values:

        class Delivery < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Delivery attempt ID
          #
          #   @return [String]
          required :id, String

          # @!attribute status
          #   Delivery status (lowercase)
          #
          #   @return [String]
          required :status, String

          # @!attribute timestamp
          #   Unix timestamp
          #
          #   @return [Float]
          required :timestamp, Float

          # @!attribute timestamp_iso
          #   ISO 8601 timestamp
          #
          #   @return [Time]
          required :timestamp_iso, Time, api_name: :timestampIso

          # @!attribute code
          #   SMTP response code
          #
          #   @return [Integer, nil]
          optional :code, Integer

          # @!attribute details
          #   Human-readable delivery summary. Format varies by status:
          #
          #   - **sent**: `Message for {recipient} accepted by {ip}:{port} ({hostname})`
          #   - **softfail/hardfail**:
          #     `{code} {classification}: Delivery to {recipient} failed at {ip}:{port} ({hostname})`
          #
          #   @return [String, nil]
          optional :details, String

          # @!attribute output
          #   Raw SMTP response from the receiving mail server
          #
          #   @return [String, nil]
          optional :output, String

          # @!attribute sent_with_ssl
          #   Whether TLS was used
          #
          #   @return [Boolean, nil]
          optional :sent_with_ssl, ArkEmail::Internal::Type::Boolean, api_name: :sentWithSsl

          # @!method initialize(id:, status:, timestamp:, timestamp_iso:, code: nil, details: nil, output: nil, sent_with_ssl: nil)
          #   Some parameter documentations has been truncated, see
          #   {ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery} for more
          #   details.
          #
          #   @param id [String] Delivery attempt ID
          #
          #   @param status [String] Delivery status (lowercase)
          #
          #   @param timestamp [Float] Unix timestamp
          #
          #   @param timestamp_iso [Time] ISO 8601 timestamp
          #
          #   @param code [Integer] SMTP response code
          #
          #   @param details [String] Human-readable delivery summary. Format varies by status:
          #
          #   @param output [String] Raw SMTP response from the receiving mail server
          #
          #   @param sent_with_ssl [Boolean] Whether TLS was used
        end

        # @see ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data#retry_state
        class RetryState < ArkEmail::Internal::Type::BaseModel
          # @!attribute attempt
          #   Current attempt number (0-indexed). The first delivery attempt is 0, the first
          #   retry is 1, and so on.
          #
          #   @return [Integer]
          required :attempt, Integer

          # @!attribute attempts_remaining
          #   Number of attempts remaining before the message is hard-failed. Calculated as
          #   `maxAttempts - attempt`.
          #
          #   @return [Integer]
          required :attempts_remaining, Integer, api_name: :attemptsRemaining

          # @!attribute manual
          #   Whether this queue entry was created by a manual retry request. Manual retries
          #   bypass certain hold conditions like suppression lists.
          #
          #   @return [Boolean]
          required :manual, ArkEmail::Internal::Type::Boolean

          # @!attribute max_attempts
          #   Maximum number of delivery attempts before the message is hard-failed.
          #   Configured at the server level.
          #
          #   @return [Integer]
          required :max_attempts, Integer, api_name: :maxAttempts

          # @!attribute processing
          #   Whether the message is currently being processed by a delivery worker. When
          #   `true`, the message is actively being sent.
          #
          #   @return [Boolean]
          required :processing, ArkEmail::Internal::Type::Boolean

          # @!attribute next_retry_at
          #   Unix timestamp of when the next retry attempt is scheduled. `null` if the
          #   message is ready for immediate processing or currently being processed.
          #
          #   @return [Float, nil]
          optional :next_retry_at, Float, api_name: :nextRetryAt, nil?: true

          # @!attribute next_retry_at_iso
          #   ISO 8601 formatted timestamp of the next retry attempt. `null` if the message is
          #   ready for immediate processing.
          #
          #   @return [Time, nil]
          optional :next_retry_at_iso, Time, api_name: :nextRetryAtIso, nil?: true

          # @!method initialize(attempt:, attempts_remaining:, manual:, max_attempts:, processing:, next_retry_at: nil, next_retry_at_iso: nil)
          #   Some parameter documentations has been truncated, see
          #   {ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState} for more
          #   details.
          #
          #   Information about the current retry state of a message that is queued for
          #   delivery. Only present when the message is in the delivery queue.
          #
          #   @param attempt [Integer] Current attempt number (0-indexed). The first delivery attempt is 0,
          #
          #   @param attempts_remaining [Integer] Number of attempts remaining before the message is hard-failed.
          #
          #   @param manual [Boolean] Whether this queue entry was created by a manual retry request.
          #
          #   @param max_attempts [Integer] Maximum number of delivery attempts before the message is hard-failed.
          #
          #   @param processing [Boolean] Whether the message is currently being processed by a delivery worker.
          #
          #   @param next_retry_at [Float, nil] Unix timestamp of when the next retry attempt is scheduled.
          #
          #   @param next_retry_at_iso [Time, nil] ISO 8601 formatted timestamp of the next retry attempt.
        end

        # Current message status (lowercase). Possible values:
        #
        # - `pending` - Initial state, awaiting first delivery attempt
        # - `sent` - Successfully delivered
        # - `softfail` - Temporary failure, will retry automatically
        # - `hardfail` - Permanent failure, will not retry
        # - `held` - Held for manual review (suppression list, etc.)
        # - `bounced` - Bounced by recipient server
        #
        # @see ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data#status
        module Status
          extend ArkEmail::Internal::Type::Enum

          PENDING = :pending
          SENT = :sent
          SOFTFAIL = :softfail
          HARDFAIL = :hardfail
          HELD = :held
          BOUNCED = :bounced

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
