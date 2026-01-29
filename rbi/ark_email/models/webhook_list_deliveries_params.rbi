# typed: strong

module ArkEmail
  module Models
    class WebhookListDeliveriesParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::WebhookListDeliveriesParams,
            ArkEmail::Internal::AnyHash
          )
        end

      # Only deliveries after this Unix timestamp
      sig { returns(T.nilable(Integer)) }
      attr_reader :after

      sig { params(after: Integer).void }
      attr_writer :after

      # Only deliveries before this Unix timestamp
      sig { returns(T.nilable(Integer)) }
      attr_reader :before

      sig { params(before: Integer).void }
      attr_writer :before

      # Filter by event type
      sig do
        returns(
          T.nilable(ArkEmail::WebhookListDeliveriesParams::Event::OrSymbol)
        )
      end
      attr_reader :event

      sig do
        params(
          event: ArkEmail::WebhookListDeliveriesParams::Event::OrSymbol
        ).void
      end
      attr_writer :event

      # Page number (default 1)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Items per page (default 30, max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :per_page

      sig { params(per_page: Integer).void }
      attr_writer :per_page

      # Filter by delivery success (true = 2xx response, false = non-2xx or error)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          after: Integer,
          before: Integer,
          event: ArkEmail::WebhookListDeliveriesParams::Event::OrSymbol,
          page: Integer,
          per_page: Integer,
          success: T::Boolean,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Only deliveries after this Unix timestamp
        after: nil,
        # Only deliveries before this Unix timestamp
        before: nil,
        # Filter by event type
        event: nil,
        # Page number (default 1)
        page: nil,
        # Items per page (default 30, max 100)
        per_page: nil,
        # Filter by delivery success (true = 2xx response, false = non-2xx or error)
        success: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: Integer,
            before: Integer,
            event: ArkEmail::WebhookListDeliveriesParams::Event::OrSymbol,
            page: Integer,
            per_page: Integer,
            success: T::Boolean,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by event type
      module Event
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ArkEmail::WebhookListDeliveriesParams::Event)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_SENT =
          T.let(
            :MessageSent,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        MESSAGE_DELAYED =
          T.let(
            :MessageDelayed,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        MESSAGE_DELIVERY_FAILED =
          T.let(
            :MessageDeliveryFailed,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        MESSAGE_HELD =
          T.let(
            :MessageHeld,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        MESSAGE_BOUNCED =
          T.let(
            :MessageBounced,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        MESSAGE_LINK_CLICKED =
          T.let(
            :MessageLinkClicked,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        MESSAGE_LOADED =
          T.let(
            :MessageLoaded,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )
        DOMAIN_DNS_ERROR =
          T.let(
            :DomainDNSError,
            ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::WebhookListDeliveriesParams::Event::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
