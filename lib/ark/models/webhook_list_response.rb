# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#list
    class WebhookListResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::WebhookListResponse::Data]
      required :data, -> { Ark::Models::WebhookListResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::WebhookListResponse::Success]
      required :success, enum: -> { Ark::Models::WebhookListResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::WebhookListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::WebhookListResponse::Success]

      # @see Ark::Models::WebhookListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute webhooks
        #
        #   @return [Array<Ark::Models::WebhookListResponse::Data::Webhook>]
        required :webhooks, -> { Ark::Internal::Type::ArrayOf[Ark::Models::WebhookListResponse::Data::Webhook] }

        # @!method initialize(webhooks:)
        #   @param webhooks [Array<Ark::Models::WebhookListResponse::Data::Webhook>]

        class Webhook < Ark::Internal::Type::BaseModel
          # @!attribute id
          #   Webhook ID
          #
          #   @return [String]
          required :id, String

          # @!attribute enabled
          #
          #   @return [Boolean]
          required :enabled, Ark::Internal::Type::Boolean

          # @!attribute events
          #
          #   @return [Array<String>]
          required :events, Ark::Internal::Type::ArrayOf[String]

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

      # @see Ark::Models::WebhookListResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
