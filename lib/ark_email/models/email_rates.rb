# frozen_string_literal: true

module ArkEmail
  module Models
    class EmailRates < ArkEmail::Internal::Type::BaseModel
      # @!attribute bounce_rate
      #   Percentage of sent emails that bounced (0-1)
      #
      #   @return [Float]
      required :bounce_rate, Float

      # @!attribute delivery_rate
      #   Percentage of sent emails that were delivered (0-1)
      #
      #   @return [Float]
      required :delivery_rate, Float

      # @!method initialize(bounce_rate:, delivery_rate:)
      #   Email delivery rates (as decimals, e.g., 0.95 = 95%)
      #
      #   @param bounce_rate [Float] Percentage of sent emails that bounced (0-1)
      #
      #   @param delivery_rate [Float] Percentage of sent emails that were delivered (0-1)
    end
  end
end
