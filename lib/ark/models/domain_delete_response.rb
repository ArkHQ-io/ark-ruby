# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Domains#delete
    class DomainDeleteResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::DomainDeleteResponse::Data]
      required :data, -> { Ark::Models::DomainDeleteResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::DomainDeleteResponse::Success]
      required :success, enum: -> { Ark::Models::DomainDeleteResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::DomainDeleteResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::DomainDeleteResponse::Success]

      # @see Ark::Models::DomainDeleteResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end

      # @see Ark::Models::DomainDeleteResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
