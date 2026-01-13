# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Emails#list
    class EmailListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute after
      #   Return emails sent after this timestamp (Unix seconds or ISO 8601)
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute before
      #   Return emails sent before this timestamp
      #
      #   @return [String, nil]
      optional :before, String

      # @!attribute from
      #   Filter by sender email address
      #
      #   @return [String, nil]
      optional :from, String

      # @!attribute page
      #   Page number (starts at 1)
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute per_page
      #   Results per page (max 100)
      #
      #   @return [Integer, nil]
      optional :per_page, Integer

      # @!attribute status
      #   Filter by delivery status:
      #
      #   - `pending` - Email accepted, waiting to be processed
      #   - `sent` - Email transmitted to recipient's mail server
      #   - `softfail` - Temporary delivery failure, will retry
      #   - `hardfail` - Permanent delivery failure
      #   - `bounced` - Email bounced back
      #   - `held` - Held for manual review
      #
      #   @return [Symbol, ArkEmail::Models::EmailListParams::Status, nil]
      optional :status, enum: -> { ArkEmail::EmailListParams::Status }

      # @!attribute tag
      #   Filter by tag
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute to
      #   Filter by recipient email address
      #
      #   @return [String, nil]
      optional :to, String

      # @!method initialize(after: nil, before: nil, from: nil, page: nil, per_page: nil, status: nil, tag: nil, to: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::EmailListParams} for more details.
      #
      #   @param after [String] Return emails sent after this timestamp (Unix seconds or ISO 8601)
      #
      #   @param before [String] Return emails sent before this timestamp
      #
      #   @param from [String] Filter by sender email address
      #
      #   @param page [Integer] Page number (starts at 1)
      #
      #   @param per_page [Integer] Results per page (max 100)
      #
      #   @param status [Symbol, ArkEmail::Models::EmailListParams::Status] Filter by delivery status:
      #
      #   @param tag [String] Filter by tag
      #
      #   @param to [String] Filter by recipient email address
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Filter by delivery status:
      #
      # - `pending` - Email accepted, waiting to be processed
      # - `sent` - Email transmitted to recipient's mail server
      # - `softfail` - Temporary delivery failure, will retry
      # - `hardfail` - Permanent delivery failure
      # - `bounced` - Email bounced back
      # - `held` - Held for manual review
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
