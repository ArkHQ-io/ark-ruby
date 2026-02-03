# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialRetrieveParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::CredentialRetrieveParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        # Set to `true` to include the credential key in the response
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :reveal

        sig { params(reveal: T::Boolean).void }
        attr_writer :reveal

        sig do
          params(
            tenant_id: String,
            reveal: T::Boolean,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          # Set to `true` to include the credential key in the response
          reveal: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              reveal: T::Boolean,
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
