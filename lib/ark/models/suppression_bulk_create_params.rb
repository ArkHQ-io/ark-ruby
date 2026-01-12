# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#bulk_create
    class SuppressionBulkCreateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute suppressions
      #
      #   @return [Array<Ark::Models::SuppressionBulkCreateParams::Suppression>]
      required :suppressions, -> { Ark::Internal::Type::ArrayOf[Ark::SuppressionBulkCreateParams::Suppression] }

      # @!method initialize(suppressions:, request_options: {})
      #   @param suppressions [Array<Ark::Models::SuppressionBulkCreateParams::Suppression>]
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]

      class Suppression < Ark::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String]
        required :address, String

        # @!attribute reason
        #
        #   @return [String, nil]
        optional :reason, String

        # @!method initialize(address:, reason: nil)
        #   @param address [String]
        #   @param reason [String]
      end
    end
  end
end
