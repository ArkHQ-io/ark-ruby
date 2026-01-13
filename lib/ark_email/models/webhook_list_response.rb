# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Webhooks#list
    class WebhookListResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::WebhookListResponse::Data]
      required :data, -> { ArkEmail::Models::WebhookListResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::WebhookListResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::WebhookListResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute webhooks
        #
        #   @return [Array<ArkEmail::Models::WebhookListResponse::Data::Webhook>]
        required :webhooks,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::WebhookListResponse::Data::Webhook] }

        # @!method initialize(webhooks:)
        #   @param webhooks [Array<ArkEmail::Models::WebhookListResponse::Data::Webhook>]

        class Webhook < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Webhook ID
          #
          #   @return [String]
          required :id, String

          # @!attribute enabled
          #
          #   @return [Boolean]
          required :enabled, ArkEmail::Internal::Type::Boolean

          # @!attribute events
          #
          #   @return [Array<String>]
          required :events, ArkEmail::Internal::Type::ArrayOf[String]

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute url
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, enabled:, events:, name:, url:)
          #   @param id [String] Webhook ID
          #
          #   @param enabled [Boolean]
          #
          #   @param events [Array<String>]
          #
          #   @param name [String]
          #
          #   @param url [String]
        end
      end
    end
  end
end
