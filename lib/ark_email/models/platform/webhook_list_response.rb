# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#list
      class WebhookListResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Array<ArkEmail::Models::Platform::WebhookListResponse::Data>]
        required :data,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::Platform::WebhookListResponse::Data] }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [Array<ArkEmail::Models::Platform::WebhookListResponse::Data>]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Platform webhook ID
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

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

          # @!method initialize(id:, created_at:, enabled:, events:, name:, url:)
          #   @param id [String] Platform webhook ID
          #
          #   @param created_at [Time]
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
