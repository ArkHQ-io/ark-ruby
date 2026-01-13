# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#create
    class SuppressionCreateResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuppressionCreateResponse::Data]
      required :data, -> { Ark::Models::SuppressionCreateResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::SuppressionCreateResponse::Success]
      required :success, enum: -> { Ark::Models::SuppressionCreateResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::SuppressionCreateResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::SuppressionCreateResponse::Success]

      # @see Ark::Models::SuppressionCreateResponse#data
      class Data < Ark::Internal::Type::BaseModel
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
        #   Reason for suppression
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
        #   @param reason [String] Reason for suppression
      end

      # @see Ark::Models::SuppressionCreateResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
