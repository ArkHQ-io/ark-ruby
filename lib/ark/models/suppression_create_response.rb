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
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::SuppressionCreateResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

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
    end
  end
end
