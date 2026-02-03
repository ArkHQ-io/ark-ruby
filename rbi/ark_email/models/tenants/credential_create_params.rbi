# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialCreateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::CredentialCreateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        # Name for the credential. Can only contain letters, numbers, hyphens, and
        # underscores. Max 50 characters.
        sig { returns(String) }
        attr_accessor :name

        # Type of credential:
        #
        # - `smtp` - For SMTP-based email sending
        # - `api` - For API-based email sending
        sig do
          returns(ArkEmail::Tenants::CredentialCreateParams::Type::OrSymbol)
        end
        attr_accessor :type

        sig do
          params(
            name: String,
            type: ArkEmail::Tenants::CredentialCreateParams::Type::OrSymbol,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Name for the credential. Can only contain letters, numbers, hyphens, and
          # underscores. Max 50 characters.
          name:,
          # Type of credential:
          #
          # - `smtp` - For SMTP-based email sending
          # - `api` - For API-based email sending
          type:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              type: ArkEmail::Tenants::CredentialCreateParams::Type::OrSymbol,
              request_options: ArkEmail::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Type of credential:
        #
        # - `smtp` - For SMTP-based email sending
        # - `api` - For API-based email sending
        module Type
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ArkEmail::Tenants::CredentialCreateParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SMTP =
            T.let(
              :smtp,
              ArkEmail::Tenants::CredentialCreateParams::Type::TaggedSymbol
            )
          API =
            T.let(
              :api,
              ArkEmail::Tenants::CredentialCreateParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Tenants::CredentialCreateParams::Type::TaggedSymbol
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
