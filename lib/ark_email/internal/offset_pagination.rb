# frozen_string_literal: true

module ArkEmail
  module Internal
    # @generic Elem
    #
    # @example
    #   if offset_pagination.has_next?
    #     offset_pagination = offset_pagination.next_page
    #   end
    #
    # @example
    #   offset_pagination.auto_paging_each do |usage|
    #     puts(usage)
    #   end
    class OffsetPagination
      include ArkEmail::Internal::Type::BasePage

      # @return [Data]
      attr_accessor :data

      # @return [Boolean]
      def next_page?
        !data&.tenants.to_a.empty? && (data&.pagination&.offset.to_i + data&.tenants.to_a.size < data&.pagination&.total.to_i)
      end

      # @raise [ArkEmail::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = ArkEmail::Internal::Util.deep_merge(
          @req,
          {query: {offset: data&.pagination&.offset.to_i + data&.tenants.to_a.size}}
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
          page.data&.tenants&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [ArkEmail::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Hash | nil => data}
          if (tenants = data[:tenants]).is_a?(Array)
            data = {**data, tenants: tenants.map { ArkEmail::Internal::Type::Converter.coerce(@model, _1) }}
          end
          @data = ArkEmail::Internal::Type::Converter.coerce(ArkEmail::Internal::OffsetPagination::Data, data)
        else
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = ArkEmail::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)}>"
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute pagination
        #
        #   @return [Data::Pagination, nil]
        optional :pagination, -> { Data::Pagination }

        # @!attribute tenants
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :tenants,
                 ArkEmail::Internal::Type::ArrayOf[ArkEmail::Internal::Type::HashOf[ArkEmail::Internal::Type::Unknown]]

        # @!method initialize(pagination: nil, tenants: nil)
        #   @param pagination [Data::Pagination]
        #   @param tenants [Array<Hash{Symbol=>Object}>]

        # @see Data#pagination
        class Pagination < ArkEmail::Internal::Type::BaseModel
          # @!attribute has_more
          #
          #   @return [Boolean, nil]
          optional :has_more, ArkEmail::Internal::Type::Boolean

          # @!attribute limit
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute offset
          #
          #   @return [Integer, nil]
          optional :offset, Integer

          # @!attribute total
          #
          #   @return [Integer, nil]
          optional :total, Integer

          # @!method initialize(has_more: nil, limit: nil, offset: nil, total: nil)
          #   @param has_more [Boolean]
          #   @param limit [Integer]
          #   @param offset [Integer]
          #   @param total [Integer]
        end
      end
    end
  end
end
