# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Webhooks#retrieve
      class WebhookRetrieveResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::WebhookRetrieveResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Webhook ID
          #
          #   @return [String]
          required :id, String

          # @!attribute all_events
          #   Whether subscribed to all events
          #
          #   @return [Boolean]
          required :all_events, ArkEmail::Internal::Type::Boolean, api_name: :allEvents

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
          #   Subscribed events
          #
          #   @return [Array<Symbol, ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data::Event>]
          required :events,
                   -> { ArkEmail::Internal::Type::ArrayOf[enum: ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data::Event] }

          # @!attribute name
          #   Webhook name for identification
          #
          #   @return [String]
          required :name, String

          # @!attribute url
          #   Webhook endpoint URL
          #
          #   @return [String]
          required :url, String

          # @!attribute uuid
          #
          #   @return [String]
          required :uuid, String

          # @!method initialize(id:, all_events:, created_at:, enabled:, events:, name:, url:, uuid:)
          #   @param id [String] Webhook ID
          #
          #   @param all_events [Boolean] Whether subscribed to all events
          #
          #   @param created_at [Time]
          #
          #   @param enabled [Boolean] Whether the webhook is active
          #
          #   @param events [Array<Symbol, ArkEmail::Models::Tenants::WebhookRetrieveResponse::Data::Event>] Subscribed events
          #
          #   @param name [String] Webhook name for identification
          #
          #   @param url [String] Webhook endpoint URL
          #
          #   @param uuid [String]

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
