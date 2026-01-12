# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#retrieve
    class SuppressionRetrieveResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuppressionRetrieveResponse::Data, nil]
      optional :data, -> { Ark::Models::SuppressionRetrieveResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Ark::Internal::Type::Boolean

      # @!method initialize(data: nil, success: nil)
      #   @param data [Ark::Models::SuppressionRetrieveResponse::Data]
      #   @param success [Boolean]

      # @see Ark::Models::SuppressionRetrieveResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String, nil]
        optional :address, String

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt, nil?: true

        # @!attribute reason
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!attribute suppressed
        #
        #   @return [Boolean, nil]
        optional :suppressed, Ark::Internal::Type::Boolean

        # @!method initialize(address: nil, created_at: nil, reason: nil, suppressed: nil)
        #   @param address [String]
        #   @param created_at [Time, nil]
        #   @param reason [String, nil]
        #   @param suppressed [Boolean]
      end
    end
  end
end
