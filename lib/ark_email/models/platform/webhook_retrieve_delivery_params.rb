# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#retrieve_delivery
      class WebhookRetrieveDeliveryParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute delivery_id
        #
        #   @return [String]
        required :delivery_id, String

        # @!method initialize(delivery_id:, request_options: {})
        #   @param delivery_id [String]
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
