# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookListDeliveriesParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Platform::WebhookListDeliveriesParams,
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
            T.nilable(
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::OrSymbol
            )
          )
        end
        attr_reader :event

        sig do
          params(
            event:
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::OrSymbol
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

        # Filter by delivery success
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :success

        sig { params(success: T::Boolean).void }
        attr_writer :success

        # Filter by tenant ID
        sig { returns(T.nilable(String)) }
        attr_reader :tenant_id

        sig { params(tenant_id: String).void }
        attr_writer :tenant_id

        # Filter by platform webhook ID
        sig { returns(T.nilable(String)) }
        attr_reader :webhook_id

        sig { params(webhook_id: String).void }
        attr_writer :webhook_id

        sig do
          params(
            after: Integer,
            before: Integer,
            event:
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::OrSymbol,
            page: Integer,
            per_page: Integer,
            success: T::Boolean,
            tenant_id: String,
            webhook_id: String,
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
          # Filter by delivery success
          success: nil,
          # Filter by tenant ID
          tenant_id: nil,
          # Filter by platform webhook ID
          webhook_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              after: Integer,
              before: Integer,
              event:
                ArkEmail::Platform::WebhookListDeliveriesParams::Event::OrSymbol,
              page: Integer,
              per_page: Integer,
              success: T::Boolean,
              tenant_id: String,
              webhook_id: String,
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
              T.all(
                Symbol,
                ArkEmail::Platform::WebhookListDeliveriesParams::Event
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE_SENT =
            T.let(
              :MessageSent,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          MESSAGE_DELAYED =
            T.let(
              :MessageDelayed,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          MESSAGE_DELIVERY_FAILED =
            T.let(
              :MessageDeliveryFailed,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          MESSAGE_HELD =
            T.let(
              :MessageHeld,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          MESSAGE_BOUNCED =
            T.let(
              :MessageBounced,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          MESSAGE_LINK_CLICKED =
            T.let(
              :MessageLinkClicked,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          MESSAGE_LOADED =
            T.let(
              :MessageLoaded,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )
          DOMAIN_DNS_ERROR =
            T.let(
              :DomainDNSError,
              ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Platform::WebhookListDeliveriesParams::Event::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
