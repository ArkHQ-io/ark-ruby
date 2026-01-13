# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Suppressions#bulk_create
    class SuppressionBulkCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute suppressions
      #
      #   @return [Array<ArkEmail::Models::SuppressionBulkCreateParams::Suppression>]
      required :suppressions,
               -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::SuppressionBulkCreateParams::Suppression] }

      # @!method initialize(suppressions:, request_options: {})
      #   @param suppressions [Array<ArkEmail::Models::SuppressionBulkCreateParams::Suppression>]
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      class Suppression < ArkEmail::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String]
        required :address, String

        # @!attribute reason
        #   Reason for suppression (accepts null)
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!method initialize(address:, reason: nil)
        #   @param address [String]
        #
        #   @param reason [String, nil] Reason for suppression (accepts null)
      end
    end
  end
end
