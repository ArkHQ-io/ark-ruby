# typed: strong

module ArkEmail
  module Models
    class WebhookCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::WebhookCreateParams, ArkEmail::Internal::AnyHash)
        end

      # Events to subscribe to:
      #
      # - `MessageSent` - Email successfully delivered to recipient's server
      # - `MessageDelayed` - Temporary delivery failure, will retry
      # - `MessageDeliveryFailed` - Permanent delivery failure
      # - `MessageHeld` - Email held for manual review
      # - `MessageBounced` - Email bounced back
      # - `MessageLinkClicked` - Recipient clicked a tracked link
      # - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
      # - `DomainDNSError` - DNS configuration issue detected
      sig { returns(T::Array[ArkEmail::WebhookCreateParams::Event::OrSymbol]) }
      attr_accessor :events

      # Webhook name for identification
      sig { returns(String) }
      attr_accessor :name

      # HTTPS endpoint URL
      sig { returns(String) }
      attr_accessor :url

      # Subscribe to all events (ignores events array)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all_events

      sig { params(all_events: T::Boolean).void }
      attr_writer :all_events

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig do
        params(
          events: T::Array[ArkEmail::WebhookCreateParams::Event::OrSymbol],
          name: String,
          url: String,
          all_events: T::Boolean,
          enabled: T::Boolean,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Events to subscribe to:
        #
        # - `MessageSent` - Email successfully delivered to recipient's server
        # - `MessageDelayed` - Temporary delivery failure, will retry
        # - `MessageDeliveryFailed` - Permanent delivery failure
        # - `MessageHeld` - Email held for manual review
        # - `MessageBounced` - Email bounced back
        # - `MessageLinkClicked` - Recipient clicked a tracked link
        # - `MessageLoaded` - Recipient opened the email (tracking pixel loaded)
        # - `DomainDNSError` - DNS configuration issue detected
        events:,
        # Webhook name for identification
        name:,
        # HTTPS endpoint URL
        url:,
        # Subscribe to all events (ignores events array)
        all_events: nil,
        enabled: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            events: T::Array[ArkEmail::WebhookCreateParams::Event::OrSymbol],
            name: String,
            url: String,
            all_events: T::Boolean,
            enabled: T::Boolean,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Event
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::WebhookCreateParams::Event) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_SENT =
          T.let(
            :MessageSent,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        MESSAGE_DELAYED =
          T.let(
            :MessageDelayed,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        MESSAGE_DELIVERY_FAILED =
          T.let(
            :MessageDeliveryFailed,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        MESSAGE_HELD =
          T.let(
            :MessageHeld,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        MESSAGE_BOUNCED =
          T.let(
            :MessageBounced,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        MESSAGE_LINK_CLICKED =
          T.let(
            :MessageLinkClicked,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        MESSAGE_LOADED =
          T.let(
            :MessageLoaded,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )
        DOMAIN_DNS_ERROR =
          T.let(
            :DomainDNSError,
            ArkEmail::WebhookCreateParams::Event::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::WebhookCreateParams::Event::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
