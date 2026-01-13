# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Webhooks#update
    class WebhookUpdateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute all_events
      #
      #   @return [Boolean, nil]
      optional :all_events, ArkEmail::Internal::Type::Boolean, api_name: :allEvents

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, ArkEmail::Internal::Type::Boolean

      # @!attribute events
      #
      #   @return [Array<String>, nil]
      optional :events, ArkEmail::Internal::Type::ArrayOf[String]

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
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
