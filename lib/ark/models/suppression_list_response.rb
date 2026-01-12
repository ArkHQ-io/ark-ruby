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
      #   @return [Boolean, Ark::Models::SuppressionListResponse::Success]
      required :success, enum: -> { Ark::Models::SuppressionListResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::SuppressionListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::SuppressionListResponse::Success]

      # @see Ark::Models::SuppressionListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute pagination
        #
        #   @return [Ark::Models::Pagination]
        required :pagination, -> { Ark::Pagination }

        # @!attribute suppressions
        #
        #   @return [Array<Ark::Models::SuppressionListResponse::Data::Suppression>]
        required :suppressions,
                 -> { Ark::Internal::Type::ArrayOf[Ark::Models::SuppressionListResponse::Data::Suppression] }

        # @!method initialize(pagination:, suppressions:)
        #   @param pagination [Ark::Models::Pagination]
        #   @param suppressions [Array<Ark::Models::SuppressionListResponse::Data::Suppression>]

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

      # @see Ark::Models::SuppressionListResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
