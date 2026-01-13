# frozen_string_literal: true

module Ark
  module Internal
    # @generic Elem
    #
    # @example
    #   if page_number.has_next?
    #     page_number = page_number.next_page
    #   end
    #
    # @example
    #   page_number.auto_paging_each do |item|
    #     puts(item)
    #   end
    class PageNumber
      include Ark::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :messages

      # @return [Boolean]
      def next_page?
        !messages.to_a.empty?
      end

      # @raise [Ark::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Ark::Internal::Util.deep_merge(
          @req,
          {query: {page: @req.fetch(:query).fetch(:page, 1).to_i.succ}}
        )
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
          page.messages&.each(&blk)

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
        in {messages: Array => messages}
          @messages = messages.map { Ark::Internal::Type::Converter.coerce(@model, _1) }
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
    end
  end
end
