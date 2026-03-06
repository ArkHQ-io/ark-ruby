# typed: strong

module ArkEmail
  module Models
    module Tenants
      class SuppressionCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::SuppressionCreateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        # Email address to suppress
        sig { returns(String) }
        attr_accessor :address

        # Reason for suppression (accepts null)
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        sig do
          params(
            tenant_id: String,
            address: String,
            reason: T.nilable(String),
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          # Email address to suppress
          address:,
          # Reason for suppression (accepts null)
          reason: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              address: String,
              reason: T.nilable(String),
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
