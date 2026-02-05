# frozen_string_literal: true

module ArkEmail
  module Models
    module Platform
      # @see ArkEmail::Resources::Platform::Webhooks#list_deliveries
      class WebhookListDeliveriesParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        # @!attribute after
        #   Only deliveries after this Unix timestamp
        #
        #   @return [Integer, nil]
        optional :after, Integer

        # @!attribute before
        #   Only deliveries before this Unix timestamp
        #
        #   @return [Integer, nil]
        optional :before, Integer

        # @!attribute event
        #   Filter by event type
        #
        #   @return [Symbol, ArkEmail::Models::Platform::WebhookListDeliveriesParams::Event, nil]
        optional :event, enum: -> { ArkEmail::Platform::WebhookListDeliveriesParams::Event }

        # @!attribute page
        #   Page number (default 1)
        #
        #   @return [Integer, nil]
        optional :page, Integer

        # @!attribute per_page
        #   Items per page (default 30, max 100)
        #
        #   @return [Integer, nil]
        optional :per_page, Integer

        # @!attribute success
        #   Filter by delivery success
        #
        #   @return [Boolean, nil]
        optional :success, ArkEmail::Internal::Type::Boolean

        # @!attribute tenant_id
        #   Filter by tenant ID
        #
        #   @return [String, nil]
        optional :tenant_id, String

        # @!attribute webhook_id
        #   Filter by platform webhook ID
        #
        #   @return [String, nil]
        optional :webhook_id, String

        # @!method initialize(after: nil, before: nil, event: nil, page: nil, per_page: nil, success: nil, tenant_id: nil, webhook_id: nil, request_options: {})
        #   @param after [Integer] Only deliveries after this Unix timestamp
        #
        #   @param before [Integer] Only deliveries before this Unix timestamp
        #
        #   @param event [Symbol, ArkEmail::Models::Platform::WebhookListDeliveriesParams::Event] Filter by event type
        #
        #   @param page [Integer] Page number (default 1)
        #
        #   @param per_page [Integer] Items per page (default 30, max 100)
        #
        #   @param success [Boolean] Filter by delivery success
        #
        #   @param tenant_id [String] Filter by tenant ID
        #
        #   @param webhook_id [String] Filter by platform webhook ID
        #
        #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

        # Filter by event type
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
