# typed: strong

module ArkEmail
  module Models
    module Tenants
      class WebhookListResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::WebhookListResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Models::Tenants::WebhookListResponse::Data) }
        attr_reader :data

        sig do
          params(
            data: ArkEmail::Models::Tenants::WebhookListResponse::Data::OrHash
          ).void
        end
        attr_writer :data

        sig { returns(ArkEmail::APIMeta) }
        attr_reader :meta

        sig { params(meta: ArkEmail::APIMeta::OrHash).void }
        attr_writer :meta

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            data: ArkEmail::Models::Tenants::WebhookListResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::WebhookListResponse::Data,
              meta: ArkEmail::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end

        class Data < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::Tenants::WebhookListResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                ArkEmail::Models::Tenants::WebhookListResponse::Data::Webhook
              ]
            )
          end
          attr_accessor :webhooks

          sig do
            params(
              webhooks:
                T::Array[
                  ArkEmail::Models::Tenants::WebhookListResponse::Data::Webhook::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(webhooks:)
          end

          sig do
            override.returns(
              {
                webhooks:
                  T::Array[
                    ArkEmail::Models::Tenants::WebhookListResponse::Data::Webhook
                  ]
              }
            )
          end
          def to_hash
          end

          class Webhook < ArkEmail::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ArkEmail::Models::Tenants::WebhookListResponse::Data::Webhook,
                  ArkEmail::Internal::AnyHash
                )
              end

            # Webhook ID
            sig { returns(String) }
            attr_accessor :id

            sig { returns(T::Boolean) }
            attr_accessor :enabled

            sig { returns(T::Array[String]) }
            attr_accessor :events

            sig { returns(String) }
            attr_accessor :name

            sig { returns(String) }
            attr_accessor :url

            sig do
              params(
                id: String,
                enabled: T::Boolean,
                events: T::Array[String],
                name: String,
                url: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Webhook ID
              id:,
              enabled:,
              events:,
              name:,
              url:
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  enabled: T::Boolean,
                  events: T::Array[String],
                  name: String,
                  url: String
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
