# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#list
    class SuppressionListResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuppressionListResponse::Data]
      required :data, -> { Ark::Models::SuppressionListResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::SuppressionListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::SuppressionListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute pagination
        #
        #   @return [Ark::Models::SuppressionListResponse::Data::Pagination]
        required :pagination, -> { Ark::Models::SuppressionListResponse::Data::Pagination }

        # @!attribute suppressions
        #
        #   @return [Array<Ark::Models::SuppressionListResponse::Data::Suppression>]
        required :suppressions,
                 -> { Ark::Internal::Type::ArrayOf[Ark::Models::SuppressionListResponse::Data::Suppression] }

        # @!method initialize(pagination:, suppressions:)
        #   @param pagination [Ark::Models::SuppressionListResponse::Data::Pagination]
        #   @param suppressions [Array<Ark::Models::SuppressionListResponse::Data::Suppression>]

        # @see Ark::Models::SuppressionListResponse::Data#pagination
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

        class Suppression < Ark::Internal::Type::BaseModel
          # @!attribute id
          #   Suppression ID
          #
          #   @return [String]
          required :id, String

          # @!attribute address
          #
          #   @return [String]
          required :address, String

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute reason
          #
          #   @return [String, nil]
          optional :reason, String

          # @!method initialize(id:, address:, created_at:, reason: nil)
          #   @param id [String] Suppression ID
          #
          #   @param address [String]
          #
          #   @param created_at [Time]
          #
          #   @param reason [String]
        end
      end
    end
  end
end
