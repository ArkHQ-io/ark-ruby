# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#list
      class WebhookListParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
