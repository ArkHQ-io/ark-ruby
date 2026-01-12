# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#create
    class SuppressionCreateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute address
      #   Email address to suppress
      #
      #   @return [String]
      required :address, String

      # @!attribute reason
      #   Reason for suppression
      #
      #   @return [String, nil]
      optional :reason, String

      # @!method initialize(address:, reason: nil, request_options: {})
      #   @param address [String] Email address to suppress
      #
      #   @param reason [String] Reason for suppression
      #
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
