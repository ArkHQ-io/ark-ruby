# typed: strong

module ArkEmail
  module Models
    class EmailRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::EmailRetrieveResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::EmailRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::EmailRetrieveResponse::Data::OrHash).void
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
          data: ArkEmail::Models::EmailRetrieveResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::EmailRetrieveResponse::Data,
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
              ArkEmail::Models::EmailRetrieveResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Unique message identifier (token)
        sig { returns(String) }
        attr_accessor :id

        # Sender address
        sig { returns(String) }
        attr_accessor :from

        # Message direction
        sig do
          returns(
            ArkEmail::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
          )
        end
        attr_accessor :scope

        # Current delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        sig do
          returns(
            ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Email subject line
        sig { returns(String) }
        attr_accessor :subject

        # Unix timestamp when the email was sent
        sig { returns(Float) }
        attr_accessor :timestamp

        # ISO 8601 formatted timestamp
        sig { returns(Time) }
        attr_accessor :timestamp_iso

        # Recipient address
        sig { returns(String) }
        attr_accessor :to

        # Opens and clicks tracking data (included if expand=activity)
        sig do
          returns(
            T.nilable(ArkEmail::Models::EmailRetrieveResponse::Data::Activity)
          )
        end
        attr_reader :activity

        sig do
          params(
            activity:
              ArkEmail::Models::EmailRetrieveResponse::Data::Activity::OrHash
          ).void
        end
        attr_writer :activity

        # File attachments (included if expand=attachments)
        sig do
          returns(
            T.nilable(
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Attachment
              ]
            )
          )
        end
        attr_reader :attachments

        sig do
          params(
            attachments:
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Attachment::OrHash
              ]
          ).void
        end
        attr_writer :attachments

        # Delivery attempt history (included if expand=deliveries)
        sig do
          returns(
            T.nilable(
              T::Array[ArkEmail::Models::EmailRetrieveResponse::Data::Delivery]
            )
          )
        end
        attr_reader :deliveries

        sig do
          params(
            deliveries:
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Delivery::OrHash
              ]
          ).void
        end
        attr_writer :deliveries

        # Email headers (included if expand=headers)
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        # HTML body content (included if expand=content)
        sig { returns(T.nilable(String)) }
        attr_reader :html_body

        sig { params(html_body: String).void }
        attr_writer :html_body

        # SMTP Message-ID header
        sig { returns(T.nilable(String)) }
        attr_reader :message_id

        sig { params(message_id: String).void }
        attr_writer :message_id

        # Plain text body (included if expand=content)
        sig { returns(T.nilable(String)) }
        attr_reader :plain_body

        sig { params(plain_body: String).void }
        attr_writer :plain_body

        # Complete raw MIME message, base64 encoded (included if expand=raw). Decode this
        # to get the original RFC 2822 formatted email.
        sig { returns(T.nilable(String)) }
        attr_reader :raw_message

        sig { params(raw_message: String).void }
        attr_writer :raw_message

        # Whether the message was flagged as spam
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :spam

        sig { params(spam: T::Boolean).void }
        attr_writer :spam

        # Spam score (if applicable)
        sig { returns(T.nilable(Float)) }
        attr_reader :spam_score

        sig { params(spam_score: Float).void }
        attr_writer :spam_score

        # Optional categorization tag
        sig { returns(T.nilable(String)) }
        attr_reader :tag

        sig { params(tag: String).void }
        attr_writer :tag

        sig do
          params(
            id: String,
            from: String,
            scope:
              ArkEmail::Models::EmailRetrieveResponse::Data::Scope::OrSymbol,
            status:
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::OrSymbol,
            subject: String,
            timestamp: Float,
            timestamp_iso: Time,
            to: String,
            activity:
              ArkEmail::Models::EmailRetrieveResponse::Data::Activity::OrHash,
            attachments:
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Attachment::OrHash
              ],
            deliveries:
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Delivery::OrHash
              ],
            headers: T::Hash[Symbol, String],
            html_body: String,
            message_id: String,
            plain_body: String,
            raw_message: String,
            spam: T::Boolean,
            spam_score: Float,
            tag: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique message identifier (token)
          id:,
          # Sender address
          from:,
          # Message direction
          scope:,
          # Current delivery status:
          #
          # - `pending` - Email accepted, waiting to be processed
          # - `sent` - Email transmitted to recipient's mail server
          # - `softfail` - Temporary delivery failure, will retry
          # - `hardfail` - Permanent delivery failure
          # - `bounced` - Email bounced back
          # - `held` - Held for manual review
          status:,
          # Email subject line
          subject:,
          # Unix timestamp when the email was sent
          timestamp:,
          # ISO 8601 formatted timestamp
          timestamp_iso:,
          # Recipient address
          to:,
          # Opens and clicks tracking data (included if expand=activity)
          activity: nil,
          # File attachments (included if expand=attachments)
          attachments: nil,
          # Delivery attempt history (included if expand=deliveries)
          deliveries: nil,
          # Email headers (included if expand=headers)
          headers: nil,
          # HTML body content (included if expand=content)
          html_body: nil,
          # SMTP Message-ID header
          message_id: nil,
          # Plain text body (included if expand=content)
          plain_body: nil,
          # Complete raw MIME message, base64 encoded (included if expand=raw). Decode this
          # to get the original RFC 2822 formatted email.
          raw_message: nil,
          # Whether the message was flagged as spam
          spam: nil,
          # Spam score (if applicable)
          spam_score: nil,
          # Optional categorization tag
          tag: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              from: String,
              scope:
                ArkEmail::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol,
              status:
                ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol,
              subject: String,
              timestamp: Float,
              timestamp_iso: Time,
              to: String,
              activity: ArkEmail::Models::EmailRetrieveResponse::Data::Activity,
              attachments:
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Attachment
                ],
              deliveries:
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Delivery
                ],
              headers: T::Hash[Symbol, String],
              html_body: String,
              message_id: String,
              plain_body: String,
              raw_message: String,
              spam: T::Boolean,
              spam_score: Float,
              tag: String
            }
          )
        end
        def to_hash
        end

        # Message direction
        module Scope
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ArkEmail::Models::EmailRetrieveResponse::Data::Scope
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OUTGOING =
            T.let(
              :outgoing,
              ArkEmail::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
            )
          INCOMING =
            T.let(
              :incoming,
              ArkEmail::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Current delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        module Status
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ArkEmail::Models::EmailRetrieveResponse::Data::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          SENT =
            T.let(
              :sent,
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          SOFTFAIL =
            T.let(
              :softfail,
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          HARDFAIL =
            T.let(
              :hardfail,
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          BOUNCED =
            T.let(
              :bounced,
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          HELD =
            T.let(
              :held,
              ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Activity < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::EmailRetrieveResponse::Data::Activity,
                ArkEmail::Internal::AnyHash
              )
            end

          # List of link click events
          sig do
            returns(
              T.nilable(
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click
                ]
              )
            )
          end
          attr_reader :clicks

          sig do
            params(
              clicks:
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click::OrHash
                ]
            ).void
          end
          attr_writer :clicks

          # List of email open events
          sig do
            returns(
              T.nilable(
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open
                ]
              )
            )
          end
          attr_reader :opens

          sig do
            params(
              opens:
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open::OrHash
                ]
            ).void
          end
          attr_writer :opens

          # Opens and clicks tracking data (included if expand=activity)
          sig do
            params(
              clicks:
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click::OrHash
                ],
              opens:
                T::Array[
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # List of link click events
            clicks: nil,
            # List of email open events
            opens: nil
          )
          end

          sig do
            override.returns(
              {
                clicks:
                  T::Array[
                    ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click
                  ],
                opens:
                  T::Array[
                    ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open
                  ]
              }
            )
          end
          def to_hash
          end

          class Click < ArkEmail::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click,
                  ArkEmail::Internal::AnyHash
                )
              end

            # IP address of the clicker
            sig { returns(T.nilable(String)) }
            attr_reader :ip_address

            sig { params(ip_address: String).void }
            attr_writer :ip_address

            # Unix timestamp of the click event
            sig { returns(T.nilable(Float)) }
            attr_reader :timestamp

            sig { params(timestamp: Float).void }
            attr_writer :timestamp

            # ISO 8601 timestamp of the click event
            sig { returns(T.nilable(Time)) }
            attr_reader :timestamp_iso

            sig { params(timestamp_iso: Time).void }
            attr_writer :timestamp_iso

            # URL that was clicked
            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            # User agent of the email client
            sig { returns(T.nilable(String)) }
            attr_reader :user_agent

            sig { params(user_agent: String).void }
            attr_writer :user_agent

            sig do
              params(
                ip_address: String,
                timestamp: Float,
                timestamp_iso: Time,
                url: String,
                user_agent: String
              ).returns(T.attached_class)
            end
            def self.new(
              # IP address of the clicker
              ip_address: nil,
              # Unix timestamp of the click event
              timestamp: nil,
              # ISO 8601 timestamp of the click event
              timestamp_iso: nil,
              # URL that was clicked
              url: nil,
              # User agent of the email client
              user_agent: nil
            )
            end

            sig do
              override.returns(
                {
                  ip_address: String,
                  timestamp: Float,
                  timestamp_iso: Time,
                  url: String,
                  user_agent: String
                }
              )
            end
            def to_hash
            end
          end

          class Open < ArkEmail::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open,
                  ArkEmail::Internal::AnyHash
                )
              end

            # IP address of the opener
            sig { returns(T.nilable(String)) }
            attr_reader :ip_address

            sig { params(ip_address: String).void }
            attr_writer :ip_address

            # Unix timestamp of the open event
            sig { returns(T.nilable(Float)) }
            attr_reader :timestamp

            sig { params(timestamp: Float).void }
            attr_writer :timestamp

            # ISO 8601 timestamp of the open event
            sig { returns(T.nilable(Time)) }
            attr_reader :timestamp_iso

            sig { params(timestamp_iso: Time).void }
            attr_writer :timestamp_iso

            # User agent of the email client
            sig { returns(T.nilable(String)) }
            attr_reader :user_agent

            sig { params(user_agent: String).void }
            attr_writer :user_agent

            sig do
              params(
                ip_address: String,
                timestamp: Float,
                timestamp_iso: Time,
                user_agent: String
              ).returns(T.attached_class)
            end
            def self.new(
              # IP address of the opener
              ip_address: nil,
              # Unix timestamp of the open event
              timestamp: nil,
              # ISO 8601 timestamp of the open event
              timestamp_iso: nil,
              # User agent of the email client
              user_agent: nil
            )
            end

            sig do
              override.returns(
                {
                  ip_address: String,
                  timestamp: Float,
                  timestamp_iso: Time,
                  user_agent: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class Attachment < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::EmailRetrieveResponse::Data::Attachment,
                ArkEmail::Internal::AnyHash
              )
            end

          # MIME type of the attachment
          sig { returns(String) }
          attr_accessor :content_type

          # Base64 encoded attachment content. Decode this to get the raw file bytes.
          sig { returns(String) }
          attr_accessor :data

          # Original filename of the attachment
          sig { returns(String) }
          attr_accessor :filename

          # SHA256 hash of the attachment content for verification
          sig { returns(String) }
          attr_accessor :hash_

          # Size of the attachment in bytes
          sig { returns(Integer) }
          attr_accessor :size

          # An email attachment retrieved from a sent message
          sig do
            params(
              content_type: String,
              data: String,
              filename: String,
              hash_: String,
              size: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # MIME type of the attachment
            content_type:,
            # Base64 encoded attachment content. Decode this to get the raw file bytes.
            data:,
            # Original filename of the attachment
            filename:,
            # SHA256 hash of the attachment content for verification
            hash_:,
            # Size of the attachment in bytes
            size:
          )
          end

          sig do
            override.returns(
              {
                content_type: String,
                data: String,
                filename: String,
                hash_: String,
                size: Integer
              }
            )
          end
          def to_hash
          end
        end

        class Delivery < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::EmailRetrieveResponse::Data::Delivery,
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
      end
    end
  end
end
