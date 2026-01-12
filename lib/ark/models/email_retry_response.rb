# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Emails#retry_
    class EmailRetryResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::EmailRetryResponse::Data, nil]
      optional :data, -> { Ark::Models::EmailRetryResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Ark::Internal::Type::Boolean

      # @!method initialize(data: nil, success: nil)
      #   @param data [Ark::Models::EmailRetryResponse::Data]
      #   @param success [Boolean]

      # @see Ark::Models::EmailRetryResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil)
        #   @param message [String]
      end
    end
  end
end
