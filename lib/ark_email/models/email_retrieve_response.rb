# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#retrieve
    class EmailRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::EmailRetrieveResponse::Data]
      required :data, -> { ArkEmail::Models::EmailRetrieveResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::EmailRetrieveResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::EmailRetrieveResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Unique message identifier (token)
        #
        #   @return [String]
        required :id, String

        # @!attribute from
        #   Sender address
        #
        #   @return [String]
        required :from, String

        # @!attribute scope
        #   Message direction
        #
        #   @return [Symbol, ArkEmail::Models::EmailRetrieveResponse::Data::Scope]
        required :scope, enum: -> { ArkEmail::Models::EmailRetrieveResponse::Data::Scope }

        # @!attribute status
        #   Current delivery status:
        #
        #   - `pending` - Email accepted, waiting to be processed
        #   - `sent` - Email transmitted to recipient's mail server
        #   - `softfail` - Temporary delivery failure, will retry
        #   - `hardfail` - Permanent delivery failure
        #   - `bounced` - Email bounced back
        #   - `held` - Held for manual review
        #
        #   @return [Symbol, ArkEmail::Models::EmailRetrieveResponse::Data::Status]
        required :status, enum: -> { ArkEmail::Models::EmailRetrieveResponse::Data::Status }

        # @!attribute subject
        #   Email subject line
        #
        #   @return [String]
        required :subject, String

        # @!attribute timestamp
        #   Unix timestamp when the email was sent
        #
        #   @return [Float]
        required :timestamp, Float

        # @!attribute timestamp_iso
        #   ISO 8601 formatted timestamp
        #
        #   @return [Time]
        required :timestamp_iso, Time, api_name: :timestampIso

        # @!attribute to
        #   Recipient address
        #
        #   @return [String]
        required :to, String

        # @!attribute activity
        #   Opens and clicks tracking data (included if expand=activity)
        #
        #   @return [ArkEmail::Models::EmailRetrieveResponse::Data::Activity, nil]
        optional :activity, -> { ArkEmail::Models::EmailRetrieveResponse::Data::Activity }

        # @!attribute attachments
        #   File attachments (included if expand=attachments)
        #
        #   @return [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Attachment>, nil]
        optional :attachments,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::EmailRetrieveResponse::Data::Attachment] }

        # @!attribute deliveries
        #   Delivery attempt history (included if expand=deliveries)
        #
        #   @return [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Delivery>, nil]
        optional :deliveries,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::EmailRetrieveResponse::Data::Delivery] }

        # @!attribute headers
        #   Email headers (included if expand=headers)
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, ArkEmail::Internal::Type::HashOf[String]

        # @!attribute html_body
        #   HTML body content (included if expand=content)
        #
        #   @return [String, nil]
        optional :html_body, String, api_name: :htmlBody

        # @!attribute message_id
        #   SMTP Message-ID header
        #
        #   @return [String, nil]
        optional :message_id, String, api_name: :messageId

        # @!attribute plain_body
        #   Plain text body (included if expand=content)
        #
        #   @return [String, nil]
        optional :plain_body, String, api_name: :plainBody

        # @!attribute raw_message
        #   Complete raw MIME message, base64 encoded (included if expand=raw). Decode this
        #   to get the original RFC 2822 formatted email.
        #
        #   @return [String, nil]
        optional :raw_message, String, api_name: :rawMessage

        # @!attribute spam
        #   Whether the message was flagged as spam
        #
        #   @return [Boolean, nil]
        optional :spam, ArkEmail::Internal::Type::Boolean

        # @!attribute spam_score
        #   Spam score (if applicable)
        #
        #   @return [Float, nil]
        optional :spam_score, Float, api_name: :spamScore

        # @!attribute tag
        #   Optional categorization tag
        #
        #   @return [String, nil]
        optional :tag, String

        # @!method initialize(id:, from:, scope:, status:, subject:, timestamp:, timestamp_iso:, to:, activity: nil, attachments: nil, deliveries: nil, headers: nil, html_body: nil, message_id: nil, plain_body: nil, raw_message: nil, spam: nil, spam_score: nil, tag: nil)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::EmailRetrieveResponse::Data} for more details.
        #
        #   @param id [String] Unique message identifier (token)
        #
        #   @param from [String] Sender address
        #
        #   @param scope [Symbol, ArkEmail::Models::EmailRetrieveResponse::Data::Scope] Message direction
        #
        #   @param status [Symbol, ArkEmail::Models::EmailRetrieveResponse::Data::Status] Current delivery status:
        #
        #   @param subject [String] Email subject line
        #
        #   @param timestamp [Float] Unix timestamp when the email was sent
        #
        #   @param timestamp_iso [Time] ISO 8601 formatted timestamp
        #
        #   @param to [String] Recipient address
        #
        #   @param activity [ArkEmail::Models::EmailRetrieveResponse::Data::Activity] Opens and clicks tracking data (included if expand=activity)
        #
        #   @param attachments [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Attachment>] File attachments (included if expand=attachments)
        #
        #   @param deliveries [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Delivery>] Delivery attempt history (included if expand=deliveries)
        #
        #   @param headers [Hash{Symbol=>String}] Email headers (included if expand=headers)
        #
        #   @param html_body [String] HTML body content (included if expand=content)
        #
        #   @param message_id [String] SMTP Message-ID header
        #
        #   @param plain_body [String] Plain text body (included if expand=content)
        #
        #   @param raw_message [String] Complete raw MIME message, base64 encoded (included if expand=raw).
        #
        #   @param spam [Boolean] Whether the message was flagged as spam
        #
        #   @param spam_score [Float] Spam score (if applicable)
        #
        #   @param tag [String] Optional categorization tag

        # Message direction
        #
        # @see ArkEmail::Models::EmailRetrieveResponse::Data#scope
        module Scope
          extend ArkEmail::Internal::Type::Enum

          OUTGOING = :outgoing
          INCOMING = :incoming

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Current delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        #
        # @see ArkEmail::Models::EmailRetrieveResponse::Data#status
        module Status
          extend ArkEmail::Internal::Type::Enum

          PENDING = :pending
          SENT = :sent
          SOFTFAIL = :softfail
          HARDFAIL = :hardfail
          BOUNCED = :bounced
          HELD = :held

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ArkEmail::Models::EmailRetrieveResponse::Data#activity
        class Activity < ArkEmail::Internal::Type::BaseModel
          # @!attribute clicks
          #   List of link click events
          #
          #   @return [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click>, nil]
          optional :clicks,
                   -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click] }

          # @!attribute opens
          #   List of email open events
          #
          #   @return [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open>, nil]
          optional :opens,
                   -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open] }

          # @!method initialize(clicks: nil, opens: nil)
          #   Opens and clicks tracking data (included if expand=activity)
          #
          #   @param clicks [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Click>] List of link click events
          #
          #   @param opens [Array<ArkEmail::Models::EmailRetrieveResponse::Data::Activity::Open>] List of email open events

          class Click < ArkEmail::Internal::Type::BaseModel
            # @!attribute ip_address
            #   IP address of the clicker
            #
            #   @return [String, nil]
            optional :ip_address, String, api_name: :ipAddress

            # @!attribute timestamp
            #   Unix timestamp of the click event
            #
            #   @return [Float, nil]
            optional :timestamp, Float

            # @!attribute timestamp_iso
            #   ISO 8601 timestamp of the click event
            #
            #   @return [Time, nil]
            optional :timestamp_iso, Time, api_name: :timestampIso

            # @!attribute url
            #   URL that was clicked
            #
            #   @return [String, nil]
            optional :url, String

            # @!attribute user_agent
            #   User agent of the email client
            #
            #   @return [String, nil]
            optional :user_agent, String, api_name: :userAgent

            # @!method initialize(ip_address: nil, timestamp: nil, timestamp_iso: nil, url: nil, user_agent: nil)
            #   @param ip_address [String] IP address of the clicker
            #
            #   @param timestamp [Float] Unix timestamp of the click event
            #
            #   @param timestamp_iso [Time] ISO 8601 timestamp of the click event
            #
            #   @param url [String] URL that was clicked
            #
            #   @param user_agent [String] User agent of the email client
          end

          class Open < ArkEmail::Internal::Type::BaseModel
            # @!attribute ip_address
            #   IP address of the opener
            #
            #   @return [String, nil]
            optional :ip_address, String, api_name: :ipAddress

            # @!attribute timestamp
            #   Unix timestamp of the open event
            #
            #   @return [Float, nil]
            optional :timestamp, Float

            # @!attribute timestamp_iso
            #   ISO 8601 timestamp of the open event
            #
            #   @return [Time, nil]
            optional :timestamp_iso, Time, api_name: :timestampIso

            # @!attribute user_agent
            #   User agent of the email client
            #
            #   @return [String, nil]
            optional :user_agent, String, api_name: :userAgent

            # @!method initialize(ip_address: nil, timestamp: nil, timestamp_iso: nil, user_agent: nil)
            #   @param ip_address [String] IP address of the opener
            #
            #   @param timestamp [Float] Unix timestamp of the open event
            #
            #   @param timestamp_iso [Time] ISO 8601 timestamp of the open event
            #
            #   @param user_agent [String] User agent of the email client
          end
        end

        class Attachment < ArkEmail::Internal::Type::BaseModel
          # @!attribute content_type
          #   MIME type of the attachment
          #
          #   @return [String]
          required :content_type, String, api_name: :contentType

          # @!attribute data
          #   Base64 encoded attachment content. Decode this to get the raw file bytes.
          #
          #   @return [String]
          required :data, String

          # @!attribute filename
          #   Original filename of the attachment
          #
          #   @return [String]
          required :filename, String

          # @!attribute hash_
          #   SHA256 hash of the attachment content for verification
          #
          #   @return [String]
          required :hash_, String, api_name: :hash

          # @!attribute size
          #   Size of the attachment in bytes
          #
          #   @return [Integer]
          required :size, Integer

          # @!method initialize(content_type:, data:, filename:, hash_:, size:)
          #   Some parameter documentations has been truncated, see
          #   {ArkEmail::Models::EmailRetrieveResponse::Data::Attachment} for more details.
          #
          #   An email attachment retrieved from a sent message
          #
          #   @param content_type [String] MIME type of the attachment
          #
          #   @param data [String] Base64 encoded attachment content. Decode this to get the raw file bytes.
          #
          #   @param filename [String] Original filename of the attachment
          #
          #   @param hash_ [String] SHA256 hash of the attachment content for verification
          #
          #   @param size [Integer] Size of the attachment in bytes
        end

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
          #   Status details
          #
          #   @return [String, nil]
          optional :details, String

          # @!attribute output
          #   SMTP server response from the receiving mail server
          #
          #   @return [String, nil]
          optional :output, String

          # @!attribute sent_with_ssl
          #   Whether TLS was used
          #
          #   @return [Boolean, nil]
          optional :sent_with_ssl, ArkEmail::Internal::Type::Boolean, api_name: :sentWithSsl

          # @!method initialize(id:, status:, timestamp:, timestamp_iso:, code: nil, details: nil, output: nil, sent_with_ssl: nil)
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
          #   @param details [String] Status details
          #
          #   @param output [String] SMTP server response from the receiving mail server
          #
          #   @param sent_with_ssl [Boolean] Whether TLS was used
        end
      end
    end
  end
end
