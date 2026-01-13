# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#bulk_create
    class SuppressionBulkCreateResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuppressionBulkCreateResponse::Data]
      required :data, -> { Ark::Models::SuppressionBulkCreateResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::SuppressionBulkCreateResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::SuppressionBulkCreateResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute added
        #   Newly suppressed addresses
        #
        #   @return [Integer]
        required :added, Integer

        # @!attribute failed
        #   Invalid addresses skipped
        #
        #   @return [Integer]
        required :failed, Integer

        # @!attribute total_requested
        #   Total addresses in request
        #
        #   @return [Integer]
        required :total_requested, Integer, api_name: :totalRequested

        # @!attribute updated
        #   Already suppressed addresses (updated reason)
        #
        #   @return [Integer]
        required :updated, Integer

        # @!method initialize(added:, failed:, total_requested:, updated:)
        #   @param added [Integer] Newly suppressed addresses
        #
        #   @param failed [Integer] Invalid addresses skipped
        #
        #   @param total_requested [Integer] Total addresses in request
        #
        #   @param updated [Integer] Already suppressed addresses (updated reason)
      end
    end
  end
end
