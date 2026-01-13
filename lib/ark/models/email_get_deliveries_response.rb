# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#get_deliveries
    class EmailGetDeliveriesResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::EmailGetDeliveriesResponse::Data]
      required :data, -> { Ark::Models::EmailGetDeliveriesResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::EmailGetDeliveriesResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::EmailGetDeliveriesResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute deliveries
        #
        #   @return [Array<Ark::Models::Delivery>]
        required :deliveries, -> { Ark::Internal::Type::ArrayOf[Ark::Delivery] }

        # @!attribute message_id
        #   Internal message ID
        #
        #   @return [String]
        required :message_id, String, api_name: :messageId

        # @!attribute message_token
        #   Message token
        #
        #   @return [String]
        required :message_token, String, api_name: :messageToken

        # @!method initialize(deliveries:, message_id:, message_token:)
        #   @param deliveries [Array<Ark::Models::Delivery>]
        #
        #   @param message_id [String] Internal message ID
        #
        #   @param message_token [String] Message token
      end
    end
  end
end
