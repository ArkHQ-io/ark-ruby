# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#list
    class EmailListResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::EmailListResponse::Data]
      required :data, -> { Ark::Models::EmailListResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::EmailListResponse::Success]
      required :success, enum: -> { Ark::Models::EmailListResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::EmailListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::EmailListResponse::Success]

      # @see Ark::Models::EmailListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute messages
        #
        #   @return [Array<Ark::Models::EmailListResponse::Data::Message>]
        required :messages, -> { Ark::Internal::Type::ArrayOf[Ark::Models::EmailListResponse::Data::Message] }

        # @!attribute pagination
        #
        #   @return [Ark::Models::EmailListResponse::Data::Pagination]
        required :pagination, -> { Ark::Models::EmailListResponse::Data::Pagination }

        # @!method initialize(messages:, pagination:)
        #   @param messages [Array<Ark::Models::EmailListResponse::Data::Message>]
        #   @param pagination [Ark::Models::EmailListResponse::Data::Pagination]

        class Message < Ark::Internal::Type::BaseModel
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
          #   @return [Symbol, Ark::Models::EmailListResponse::Data::Message::Status]
          required :status, enum: -> { Ark::Models::EmailListResponse::Data::Message::Status }

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
          #   {Ark::Models::EmailListResponse::Data::Message} for more details.
          #
          #   @param id [String] Internal message ID
          #
          #   @param token [String]
          #
          #   @param from [String]
          #
          #   @param status [Symbol, Ark::Models::EmailListResponse::Data::Message::Status] Current delivery status:
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
          # @see Ark::Models::EmailListResponse::Data::Message#status
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

        # @see Ark::Models::EmailListResponse::Data#pagination
        class Pagination < Ark::Internal::Type::BaseModel
          # @!attribute page
          #   Current page number (1-indexed)
          #
          #   @return [Integer]
          required :page, Integer

          # @!attribute per_page
          #   Items per page
          #
          #   @return [Integer]
          required :per_page, Integer, api_name: :perPage

          # @!attribute total
          #   Total number of items
          #
          #   @return [Integer]
          required :total, Integer

          # @!attribute total_pages
          #   Total number of pages
          #
          #   @return [Integer]
          required :total_pages, Integer, api_name: :totalPages

          # @!method initialize(page:, per_page:, total:, total_pages:)
          #   @param page [Integer] Current page number (1-indexed)
          #
          #   @param per_page [Integer] Items per page
          #
          #   @param total [Integer] Total number of items
          #
          #   @param total_pages [Integer] Total number of pages
        end
      end

      # @see Ark::Models::EmailListResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
