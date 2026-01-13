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

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :data

      # @return [Integer]
      attr_accessor :page

      # @return [Integer]
      attr_accessor :per_page

      # @return [Integer]
      attr_accessor :total

      # @return [Integer]
      attr_accessor :total_pages

      # @return [Meta]
      attr_accessor :meta

      # @return [Boolean]
      def next_page?
        !data.to_a.empty? && (page.nil? || total_pages.nil? || page < total_pages)
      end

      # @raise [Ark::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Ark::Internal::Util.deep_merge(@req, {query: {page: (page || 1).to_i.succ}})
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
          page.data&.each(&blk)

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
        in {data: Array => data}
          @data = data.map { Ark::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @page = page_data[:page]
        @per_page = page_data[:perPage]
        @total = page_data[:total]
        @total_pages = page_data[:totalPages]
        case page_data
        in {meta: Hash | nil => meta}
          @meta = Ark::Internal::Type::Converter.coerce(Ark::Internal::PageNumberPagination::Meta, meta)
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        # rubocop:disable Layout/LineLength
        model = Ark::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} page=#{page.inspect} per_page=#{per_page.inspect} total=#{total.inspect} total_pages=#{total_pages.inspect}>"
        # rubocop:enable Layout/LineLength
      end

      class Meta < Ark::Internal::Type::BaseModel
        # @!attribute request_id
        #
        #   @return [String, nil]
        optional :request_id, String, api_name: :requestId

        # @!method initialize(request_id: nil)
        #   @param request_id [String]
      end
    end
  end
end
