# frozen_string_literal: true

module Ark
  module Internal
    # @generic Elem
    #
    # @example
    #   if page_number_pagination.has_next?
    #     page_number_pagination = page_number_pagination.next_page
    #   end
    #
    # @example
    #   page_number_pagination.auto_paging_each do |email|
    #     puts(email)
    #   end
    class PageNumberPagination
      include Ark::Internal::Type::BasePage

      # @return [Data]
      attr_accessor :data

      # @return [Boolean]
      def next_page?
        !data&.messages.to_a.empty? && (data&.pagination&.page.nil? || data&.pagination&.total_pages.nil? || (data&.pagination&.page&.< data&.pagination&.total_pages))
      end

      # @raise [Ark::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Ark::Internal::Util.deep_merge(@req, {query: {page: (data&.pagination&.page || 1).to_i.succ}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.data&.messages&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Ark::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Hash | nil => data}
          if (messages = data[:messages]).is_a?(Array)
            data = {**data, messages: messages.map { Ark::Internal::Type::Converter.coerce(@model, _1) }}
          end
          @data = Ark::Internal::Type::Converter.coerce(Ark::Internal::PageNumberPagination::Data, data)
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Ark::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end

      class Data < Ark::Internal::Type::BaseModel
        # @!attribute messages
        #
        #   @return [Array<Data::Message>, nil]
        optional :messages, -> { Ark::Internal::Type::ArrayOf[Data::Message] }

        # @!attribute pagination
        #
        #   @return [Data::Pagination, nil]
        optional :pagination, -> { Data::Pagination }

        # @!method initialize(messages: nil, pagination: nil)
        #   @param messages [Array<Data::Message>]
        #   @param pagination [Data::Pagination]

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
          #   @return [Symbol, Data::Message::Status]
          required :status, enum: -> { Data::Message::Status }

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
          #   Some parameter documentations has been truncated, see {Data::Message} for more
          #   details.
          #
          #   @param id [String] Internal message ID
          #
          #   @param token [String]
          #
          #   @param from [String]
          #
          #   @param status [Symbol, Data::Message::Status] Current delivery status:
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
          # @see Data::Message#status
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

        # @see Data#pagination
        class Pagination < Ark::Internal::Type::BaseModel
          # @!attribute page
          #
          #   @return [Integer, nil]
          optional :page, Integer

          # @!attribute total_pages
          #
          #   @return [Integer, nil]
          optional :total_pages, Integer, api_name: :totalPages

          # @!method initialize(page: nil, total_pages: nil)
          #   @param page [Integer]
          #   @param total_pages [Integer]
        end
      end
    end
  end
end
