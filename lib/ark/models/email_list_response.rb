# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#list
    class EmailListResponse < Ark::Internal::Type::BaseModel
      # @!attribute id
      #   Internal message ID
      #
      #   @return [String]
      required :id, String

      # @!attribute token
      #
      #   @return [String]
      required :token, String

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
      #   @return [Symbol, Ark::Models::EmailListResponse::Status]
      required :status, enum: -> { Ark::Models::EmailListResponse::Status }

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

      # @!method initialize(id:, token:, from:, status:, subject:, timestamp:, timestamp_iso:, to:, tag: nil)
      #   Some parameter documentations has been truncated, see
      #   {Ark::Models::EmailListResponse} for more details.
      #
      #   @param id [String] Internal message ID
      #
      #   @param token [String]
      #
      #   @param from [String]
      #
      #   @param status [Symbol, Ark::Models::EmailListResponse::Status] Current delivery status:
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
      # @see Ark::Models::EmailListResponse#status
      module Status
        extend Ark::Internal::Type::Enum

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
