# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookRetrieveDeliveryParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::WebhookRetrieveDeliveryParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        sig { returns(String) }
        attr_accessor :webhook_id

        sig do
          params(
            tenant_id: String,
            webhook_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(tenant_id:, webhook_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              webhook_id: String,
              request_options: ArkEmail::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
