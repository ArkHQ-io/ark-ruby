# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookReplayDeliveryParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Platform::WebhookReplayDeliveryParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :delivery_id

        sig do
          params(
            delivery_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(delivery_id:, request_options: {})
        end

        sig do
          override.returns(
            { delivery_id: String, request_options: ArkEmail::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
