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
      optional :all_events, ArkEmail::Internal::Type::Boolean, api_name: :allEvents, nil?: true

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, ArkEmail::Internal::Type::Boolean, nil?: true

      # @!attribute events
      #
      #   @return [Array<String>, nil]
      optional :events, ArkEmail::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(all_events: nil, enabled: nil, events: nil, name: nil, url: nil, request_options: {})
      #   @param all_events [Boolean, nil]
      #   @param enabled [Boolean, nil]
      #   @param events [Array<String>, nil]
      #   @param name [String, nil]
      #   @param url [String, nil]
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
