# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialListParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::CredentialListParams,
              ArkEmail::Internal::AnyHash
            )
          end

        # Page number (1-indexed)
        sig { returns(T.nilable(Integer)) }
        attr_reader :page

        sig { params(page: Integer).void }
        attr_writer :page

        # Number of items per page (max 100)
        sig { returns(T.nilable(Integer)) }
        attr_reader :per_page

        sig { params(per_page: Integer).void }
        attr_writer :per_page

        # Filter by credential type
        sig do
          returns(
            T.nilable(ArkEmail::Tenants::CredentialListParams::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: ArkEmail::Tenants::CredentialListParams::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            page: Integer,
            per_page: Integer,
            type: ArkEmail::Tenants::CredentialListParams::Type::OrSymbol,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Page number (1-indexed)
          page: nil,
          # Number of items per page (max 100)
          per_page: nil,
          # Filter by credential type
          type: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              page: Integer,
              per_page: Integer,
              type: ArkEmail::Tenants::CredentialListParams::Type::OrSymbol,
              request_options: ArkEmail::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Filter by credential type
        module Type
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ArkEmail::Tenants::CredentialListParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SMTP =
            T.let(
              :smtp,
              ArkEmail::Tenants::CredentialListParams::Type::TaggedSymbol
            )
          API =
            T.let(
              :api,
              ArkEmail::Tenants::CredentialListParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Tenants::CredentialListParams::Type::TaggedSymbol
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
