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
        #   Internal message ID
        #
        #   @return [String]
        required :id, String

        # @!attribute token
        #   Unique message token used to retrieve this email via API. Combined with id to
        #   form the full message identifier: msg*{id}*{token} Use this token with GET
        #   /emails/{emailId} where emailId = "msg*{id}*{token}"
        #
        #   @return [String]
        required :token, String

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

        # @!method initialize(id:, token:, from:, scope:, status:, subject:, timestamp:, timestamp_iso:, to:, deliveries: nil, headers: nil, html_body: nil, message_id: nil, plain_body: nil, spam: nil, spam_score: nil, tag: nil)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::EmailRetrieveResponse::Data} for more details.
        #
        #   @param id [String] Internal message ID
        #
        #   @param token [String] Unique message token used to retrieve this email via API.
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
