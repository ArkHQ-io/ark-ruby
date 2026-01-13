# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Suppressions#retrieve
    class SuppressionRetrieveResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::SuppressionRetrieveResponse::Data]
      required :data, -> { Ark::Models::SuppressionRetrieveResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::SuppressionRetrieveResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::SuppressionRetrieveResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute address
        #   The email address that was checked
        #
        #   @return [String]
        required :address, String

        # @!attribute suppressed
        #   Whether the address is currently suppressed
        #
        #   @return [Boolean]
        required :suppressed, Ark::Internal::Type::Boolean

        # @!attribute created_at
        #   When the suppression was created (if suppressed)
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt, nil?: true

        # @!attribute reason
        #   Reason for suppression (if suppressed)
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!method initialize(address:, suppressed:, created_at: nil, reason: nil)
        #   @param address [String] The email address that was checked
        #
        #   @param suppressed [Boolean] Whether the address is currently suppressed
        #
        #   @param created_at [Time, nil] When the suppression was created (if suppressed)
        #
        #   @param reason [String, nil] Reason for suppression (if suppressed)
      end
    end
  end
end
