# frozen_string_literal: true

module Ark
  module Models
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
end
