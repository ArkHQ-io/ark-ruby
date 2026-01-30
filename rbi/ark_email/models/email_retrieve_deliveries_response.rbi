# typed: strong

module ArkEmail
  module Models
    class EmailRetrieveDeliveriesResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::EmailRetrieveDeliveriesResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data,
            meta: ArkEmail::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Message identifier (token)
        sig { returns(String) }
        attr_accessor :id

        # Whether the message can be manually retried via `POST /emails/{id}/retry`.
        # `true` when the raw message content is still available (not expired). Messages
        # older than the retention period cannot be retried.
        sig { returns(T::Boolean) }
        attr_accessor :can_retry_manually

        # Chronological list of delivery attempts for this message. Each attempt includes
        # SMTP response codes and timestamps.
        sig do
          returns(
            T::Array[
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery
            ]
          )
        end
        attr_accessor :deliveries

        # Information about the current retry state of a message that is queued for
        # delivery. Only present when the message is in the delivery queue.
        sig do
          returns(
            T.nilable(
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState
            )
          )
        end
        attr_reader :retry_state

        sig do
          params(
            retry_state:
              T.nilable(
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState::OrHash
              )
          ).void
        end
        attr_writer :retry_state

        # Current message status (lowercase). Possible values:
        #
        # - `pending` - Initial state, awaiting first delivery attempt
        # - `sent` - Successfully delivered
        # - `softfail` - Temporary failure, will retry automatically
        # - `hardfail` - Permanent failure, will not retry
        # - `held` - Held for manual review (suppression list, etc.)
        # - `bounced` - Bounced by recipient server
        sig do
          returns(
            ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            id: String,
            can_retry_manually: T::Boolean,
            deliveries:
              T::Array[
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery::OrHash
              ],
            retry_state:
              T.nilable(
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState::OrHash
              ),
            status:
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Message identifier (token)
          id:,
          # Whether the message can be manually retried via `POST /emails/{id}/retry`.
          # `true` when the raw message content is still available (not expired). Messages
          # older than the retention period cannot be retried.
          can_retry_manually:,
          # Chronological list of delivery attempts for this message. Each attempt includes
          # SMTP response codes and timestamps.
          deliveries:,
          # Information about the current retry state of a message that is queued for
          # delivery. Only present when the message is in the delivery queue.
          retry_state:,
          # Current message status (lowercase). Possible values:
          #
          # - `pending` - Initial state, awaiting first delivery attempt
          # - `sent` - Successfully delivered
          # - `softfail` - Temporary failure, will retry automatically
          # - `hardfail` - Permanent failure, will not retry
          # - `held` - Held for manual review (suppression list, etc.)
          # - `bounced` - Bounced by recipient server
          status:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              can_retry_manually: T::Boolean,
              deliveries:
                T::Array[
                  ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery
                ],
              retry_state:
                T.nilable(
                  ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState
                ),
              status:
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Delivery < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Delivery,
                ArkEmail::Internal::AnyHash
              )
            end

          # Delivery attempt ID
          sig { returns(String) }
          attr_accessor :id

          # Delivery status (lowercase)
          sig { returns(String) }
          attr_accessor :status

          # Unix timestamp
          sig { returns(Float) }
          attr_accessor :timestamp

          # ISO 8601 timestamp
          sig { returns(Time) }
          attr_accessor :timestamp_iso

          # SMTP response code
          sig { returns(T.nilable(Integer)) }
          attr_reader :code

          sig { params(code: Integer).void }
          attr_writer :code

          # Status details
          sig { returns(T.nilable(String)) }
          attr_reader :details

          sig { params(details: String).void }
          attr_writer :details

          # SMTP server response from the receiving mail server
          sig { returns(T.nilable(String)) }
          attr_reader :output

          sig { params(output: String).void }
          attr_writer :output

          # Whether TLS was used
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :sent_with_ssl

          sig { params(sent_with_ssl: T::Boolean).void }
          attr_writer :sent_with_ssl

          sig do
            params(
              id: String,
              status: String,
              timestamp: Float,
              timestamp_iso: Time,
              code: Integer,
              details: String,
              output: String,
              sent_with_ssl: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Delivery attempt ID
            id:,
            # Delivery status (lowercase)
            status:,
            # Unix timestamp
            timestamp:,
            # ISO 8601 timestamp
            timestamp_iso:,
            # SMTP response code
            code: nil,
            # Status details
            details: nil,
            # SMTP server response from the receiving mail server
            output: nil,
            # Whether TLS was used
            sent_with_ssl: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                status: String,
                timestamp: Float,
                timestamp_iso: Time,
                code: Integer,
                details: String,
                output: String,
                sent_with_ssl: T::Boolean
              }
            )
          end
          def to_hash
          end
        end

        class RetryState < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::RetryState,
                ArkEmail::Internal::AnyHash
              )
            end

          # Current attempt number (0-indexed). The first delivery attempt is 0, the first
          # retry is 1, and so on.
          sig { returns(Integer) }
          attr_accessor :attempt

          # Number of attempts remaining before the message is hard-failed. Calculated as
          # `maxAttempts - attempt`.
          sig { returns(Integer) }
          attr_accessor :attempts_remaining

          # Whether this queue entry was created by a manual retry request. Manual retries
          # bypass certain hold conditions like suppression lists.
          sig { returns(T::Boolean) }
          attr_accessor :manual

          # Maximum number of delivery attempts before the message is hard-failed.
          # Configured at the server level.
          sig { returns(Integer) }
          attr_accessor :max_attempts

          # Whether the message is currently being processed by a delivery worker. When
          # `true`, the message is actively being sent.
          sig { returns(T::Boolean) }
          attr_accessor :processing

          # Unix timestamp of when the next retry attempt is scheduled. `null` if the
          # message is ready for immediate processing or currently being processed.
          sig { returns(T.nilable(Float)) }
          attr_accessor :next_retry_at

          # ISO 8601 formatted timestamp of the next retry attempt. `null` if the message is
          # ready for immediate processing.
          sig { returns(T.nilable(Time)) }
          attr_accessor :next_retry_at_iso

          # Information about the current retry state of a message that is queued for
          # delivery. Only present when the message is in the delivery queue.
          sig do
            params(
              attempt: Integer,
              attempts_remaining: Integer,
              manual: T::Boolean,
              max_attempts: Integer,
              processing: T::Boolean,
              next_retry_at: T.nilable(Float),
              next_retry_at_iso: T.nilable(Time)
            ).returns(T.attached_class)
          end
          def self.new(
            # Current attempt number (0-indexed). The first delivery attempt is 0, the first
            # retry is 1, and so on.
            attempt:,
            # Number of attempts remaining before the message is hard-failed. Calculated as
            # `maxAttempts - attempt`.
            attempts_remaining:,
            # Whether this queue entry was created by a manual retry request. Manual retries
            # bypass certain hold conditions like suppression lists.
            manual:,
            # Maximum number of delivery attempts before the message is hard-failed.
            # Configured at the server level.
            max_attempts:,
            # Whether the message is currently being processed by a delivery worker. When
            # `true`, the message is actively being sent.
            processing:,
            # Unix timestamp of when the next retry attempt is scheduled. `null` if the
            # message is ready for immediate processing or currently being processed.
            next_retry_at: nil,
            # ISO 8601 formatted timestamp of the next retry attempt. `null` if the message is
            # ready for immediate processing.
            next_retry_at_iso: nil
          )
          end

          sig do
            override.returns(
              {
                attempt: Integer,
                attempts_remaining: Integer,
                manual: T::Boolean,
                max_attempts: Integer,
                processing: T::Boolean,
                next_retry_at: T.nilable(Float),
                next_retry_at_iso: T.nilable(Time)
              }
            )
          end
          def to_hash
          end
        end

        # Current message status (lowercase). Possible values:
        #
        # - `pending` - Initial state, awaiting first delivery attempt
        # - `sent` - Successfully delivered
        # - `softfail` - Temporary failure, will retry automatically
        # - `hardfail` - Permanent failure, will not retry
        # - `held` - Held for manual review (suppression list, etc.)
        # - `bounced` - Bounced by recipient server
        module Status
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            )
          SENT =
            T.let(
              :sent,
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            )
          SOFTFAIL =
            T.let(
              :softfail,
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            )
          HARDFAIL =
            T.let(
              :hardfail,
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            )
          HELD =
            T.let(
              :held,
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            )
          BOUNCED =
            T.let(
              :bounced,
              ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::EmailRetrieveDeliveriesResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
