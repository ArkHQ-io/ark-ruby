# frozen_string_literal: true

module ArkEmail
  module Models
    class UsagePeriod < ArkEmail::Internal::Type::BaseModel
      # @!attribute end_
      #   Period end (inclusive)
      #
      #   @return [Time]
      required :end_, Time, api_name: :end

      # @!attribute start
      #   Period start (inclusive)
      #
      #   @return [Time]
      required :start, Time

      # @!method initialize(end_:, start:)
      #   Time period for usage data
      #
      #   @param end_ [Time] Period end (inclusive)
      #
      #   @param start [Time] Period start (inclusive)
    end
  end
end
