# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookUpdateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::WebhookUpdateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :all_events

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :events

        sig { returns(T.nilable(String)) }
        attr_accessor :name

        sig { returns(T.nilable(String)) }
        attr_accessor :url

        sig do
          params(
            tenant_id: String,
            all_events: T.nilable(T::Boolean),
            enabled: T.nilable(T::Boolean),
            events: T.nilable(T::Array[String]),
            name: T.nilable(String),
            url: T.nilable(String),
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          all_events: nil,
          enabled: nil,
          events: nil,
          name: nil,
          url: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              all_events: T.nilable(T::Boolean),
              enabled: T.nilable(T::Boolean),
              events: T.nilable(T::Array[String]),
              name: T.nilable(String),
              url: T.nilable(String),
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
