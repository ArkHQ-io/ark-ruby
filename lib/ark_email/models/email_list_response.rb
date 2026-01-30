# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#list
    class EmailListResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute id
      #   Unique message identifier (token)
      #
      #   @return [String]
      required :id, String

      # @!attribute from
      #
      #   @return [String]
      required :from, String

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
      #   @return [Symbol, ArkEmail::Models::EmailListResponse::Status]
      required :status, enum: -> { ArkEmail::Models::EmailListResponse::Status }

      # @!attribute subject
      #
      #   @return [String]
      required :subject, String

      # @!attribute timestamp
      #
      #   @return [Float]
      required :timestamp, Float

      # @!attribute timestamp_iso
      #
      #   @return [Time]
      required :timestamp_iso, Time, api_name: :timestampIso

      # @!attribute to
      #
      #   @return [String]
      required :to, String

      # @!attribute tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!method initialize(id:, from:, status:, subject:, timestamp:, timestamp_iso:, to:, tag: nil)
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::EmailListResponse} for more details.
      #
      #   @param id [String] Unique message identifier (token)
      #
      #   @param from [String]
      #
      #   @param status [Symbol, ArkEmail::Models::EmailListResponse::Status] Current delivery status:
      #
      #   @param subject [String]
      #
      #   @param timestamp [Float]
      #
      #   @param timestamp_iso [Time]
      #
      #   @param to [String]
      #
      #   @param tag [String]

      # Current delivery status:
      #
      # - `pending` - Email accepted, waiting to be processed
      # - `sent` - Email transmitted to recipient's mail server
      # - `softfail` - Temporary delivery failure, will retry
      # - `hardfail` - Permanent delivery failure
      # - `bounced` - Email bounced back
      # - `held` - Held for manual review
      #
      # @see ArkEmail::Models::EmailListResponse#status
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
    end
  end
end
