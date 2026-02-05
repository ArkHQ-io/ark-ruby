# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#create
      class WebhookCreateResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Platform::WebhookCreateResponse::Data]
        required :data, -> { ArkEmail::Models::Platform::WebhookCreateResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Platform::WebhookCreateResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Platform::WebhookCreateResponse#data
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
          #   Whether the webhook is active
          #
          #   @return [Boolean]
          required :enabled, ArkEmail::Internal::Type::Boolean

          # @!attribute events
          #   Subscribed events (empty = all events)
          #
          #   @return [Array<Symbol, ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event>]
          required :events,
                   -> { ArkEmail::Internal::Type::ArrayOf[enum: ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event] }

          # @!attribute name
          #   Webhook name for identification
          #
          #   @return [String]
          required :name, String

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute url
          #   Webhook endpoint URL
          #
          #   @return [String]
          required :url, String

          # @!method initialize(id:, created_at:, enabled:, events:, name:, updated_at:, url:)
          #   @param id [String] Platform webhook ID
          #
          #   @param created_at [Time]
          #
          #   @param enabled [Boolean] Whether the webhook is active
          #
          #   @param events [Array<Symbol, ArkEmail::Models::Platform::WebhookCreateResponse::Data::Event>] Subscribed events (empty = all events)
          #
          #   @param name [String] Webhook name for identification
          #
          #   @param updated_at [Time]
          #
          #   @param url [String] Webhook endpoint URL

          module Event
            extend ArkEmail::Internal::Type::Enum

            MESSAGE_SENT = :MessageSent
            MESSAGE_DELAYED = :MessageDelayed
            MESSAGE_DELIVERY_FAILED = :MessageDeliveryFailed
            MESSAGE_HELD = :MessageHeld
            MESSAGE_BOUNCED = :MessageBounced
            MESSAGE_LINK_CLICKED = :MessageLinkClicked
            MESSAGE_LOADED = :MessageLoaded
            DOMAIN_DNS_ERROR = :DomainDNSError

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
