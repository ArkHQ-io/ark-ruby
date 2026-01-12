# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#list
    class WebhookListParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
