# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#list
    class SuppressionListResponse < Ark::Internal::Type::BaseModel
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
