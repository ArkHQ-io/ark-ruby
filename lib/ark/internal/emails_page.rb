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

      # @return [Boolean]
      attr_accessor :success

      # @return [Data]
      attr_accessor :data

      # @return [Meta]
      attr_accessor :meta

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

        @success = page_data[:success]
        case page_data
        in {data: Hash | nil => data}
          if (messages = data[:messages]).is_a?(Array)
            data = {**data, messages: messages.map { Ark::Internal::Type::Converter.coerce(@model, _1) }}
          end
          @data = Ark::Internal::Type::Converter.coerce(Ark::Internal::EmailsPage::Data, data)
        else
        end
        case page_data
        in {meta: Hash | nil => meta}
          @meta = Ark::Internal::Type::Converter.coerce(Ark::Internal::EmailsPage::Meta, meta)
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Ark::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} success=#{success.inspect}>"
      end

      class Data < Ark::Internal::Type::BaseModel
        # @!attribute messages
        #
        #   @return [Array<Hash{Symbol=>Object}>]
        required :messages,
                 Ark::Internal::Type::ArrayOf[Ark::Internal::Type::HashOf[Ark::Internal::Type::Unknown]]

        # @!attribute pagination
        #
        #   @return [Data::Pagination]
        required :pagination, -> { Data::Pagination }

        # @!method initialize(messages:, pagination:)
        #   @param messages [Array<Hash{Symbol=>Object}>]
        #   @param pagination [Data::Pagination]

        # @see Data#pagination
        class Pagination < Ark::Internal::Type::BaseModel
          # @!attribute page
          #
          #   @return [Integer]
          required :page, Integer

          # @!attribute per_page
          #
          #   @return [Integer]
          required :per_page, Integer, api_name: :perPage

          # @!attribute total
          #
          #   @return [Integer]
          required :total, Integer

          # @!attribute total_pages
          #
          #   @return [Integer]
          required :total_pages, Integer, api_name: :totalPages

          # @!method initialize(page:, per_page:, total:, total_pages:)
          #   @param page [Integer]
          #   @param per_page [Integer]
          #   @param total [Integer]
          #   @param total_pages [Integer]
        end
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
