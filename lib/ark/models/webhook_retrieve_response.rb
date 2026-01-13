# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Webhooks#retrieve
    class WebhookRetrieveResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::WebhookRetrieveResponse::Data]
      required :data, -> { Ark::Models::WebhookRetrieveResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::WebhookRetrieveResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::WebhookRetrieveResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute id
        #   Webhook ID
        #
        #   @return [String]
        required :id, String

        # @!attribute all_events
        #   Whether subscribed to all events
        #
        #   @return [Boolean]
        required :all_events, Ark::Internal::Type::Boolean, api_name: :allEvents

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute enabled
        #   Whether the webhook is active
        #
        #   @return [Boolean]
        required :enabled, Ark::Internal::Type::Boolean

        # @!attribute events
        #   Subscribed events
        #
        #   @return [Array<Symbol, Ark::Models::WebhookRetrieveResponse::Data::Event>]
        required :events,
                 -> { Ark::Internal::Type::ArrayOf[enum: Ark::Models::WebhookRetrieveResponse::Data::Event] }

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
        #   @param events [Array<Symbol, Ark::Models::WebhookRetrieveResponse::Data::Event>] Subscribed events
        #
        #   @param name [String] Webhook name for identification
        #
        #   @param url [String] Webhook endpoint URL
        #
        #   @param uuid [String]

        module Event
          extend Ark::Internal::Type::Enum

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
