# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Webhooks#replay_delivery
      class WebhookReplayDeliveryParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute webhook_id
        #
        #   @return [String]
        required :webhook_id, String

        # @!method initialize(tenant_id:, webhook_id:, request_options: {})
        #   @param tenant_id [String]
        #   @param webhook_id [String]
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
