# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#update
    class WebhookUpdateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute all_events
      #
      #   @return [Boolean, nil]
      optional :all_events, Ark::Internal::Type::Boolean, api_name: :allEvents

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, Ark::Internal::Type::Boolean

      # @!attribute events
      #
      #   @return [Array<String>, nil]
      optional :events, Ark::Internal::Type::ArrayOf[String]

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(all_events: nil, enabled: nil, events: nil, name: nil, url: nil, request_options: {})
      #   @param all_events [Boolean]
      #   @param enabled [Boolean]
      #   @param events [Array<String>]
      #   @param name [String]
      #   @param url [String]
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
