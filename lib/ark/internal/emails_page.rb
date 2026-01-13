# frozen_string_literal: true

module Ark
  module Internal
    # @generic Elem
    #
    # @example
    #   if emails_page.has_next?
    #     emails_page = emails_page.next_page
    #   end
    #
    # @example
    #   emails_page.auto_paging_each do |email|
    #     puts(email)
    #   end
    class EmailsPage
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
          @data = Ark::Internal::Type::Converter.coerce(Ark::Internal::EmailsPage::Data, data)
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
        #   @return [Array<Object>, nil]
        optional :messages, Ark::Internal::Type::ArrayOf[Ark::Internal::Type::Unknown]

        # @!attribute pagination
        #
        #   @return [Data::Pagination, nil]
        optional :pagination, -> { Data::Pagination }

        # @!method initialize(messages: nil, pagination: nil)
        #   @param messages [Array<Object>]
        #   @param pagination [Data::Pagination]

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
