# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialListResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::CredentialListResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        # Unique identifier for the credential
        sig { returns(Integer) }
        attr_accessor :id

        # When the credential was created
        sig { returns(Time) }
        attr_accessor :created_at

        # Whether the credential is on hold (disabled). When `true`, the credential cannot
        # be used to send emails.
        sig { returns(T::Boolean) }
        attr_accessor :hold

        # When the credential was last used to send an email
        sig { returns(T.nilable(Time)) }
        attr_accessor :last_used_at

        # Name of the credential
        sig { returns(String) }
        attr_accessor :name

        # Type of credential:
        #
        # - `smtp` - For SMTP-based email sending
        # - `api` - For API-based email sending
        sig do
          returns(
            ArkEmail::Models::Tenants::CredentialListResponse::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # When the credential was last updated
        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: Integer,
            created_at: Time,
            hold: T::Boolean,
            last_used_at: T.nilable(Time),
            name: String,
            type:
              ArkEmail::Models::Tenants::CredentialListResponse::Type::OrSymbol,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the credential
          id:,
          # When the credential was created
          created_at:,
          # Whether the credential is on hold (disabled). When `true`, the credential cannot
          # be used to send emails.
          hold:,
          # When the credential was last used to send an email
          last_used_at:,
          # Name of the credential
          name:,
          # Type of credential:
          #
          # - `smtp` - For SMTP-based email sending
          # - `api` - For API-based email sending
          type:,
          # When the credential was last updated
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: Integer,
              created_at: Time,
              hold: T::Boolean,
              last_used_at: T.nilable(Time),
              name: String,
              type:
                ArkEmail::Models::Tenants::CredentialListResponse::Type::TaggedSymbol,
              updated_at: Time
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
              T.all(
                Symbol,
                ArkEmail::Models::Tenants::CredentialListResponse::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SMTP =
            T.let(
              :smtp,
              ArkEmail::Models::Tenants::CredentialListResponse::Type::TaggedSymbol
            )
          API =
            T.let(
              :api,
              ArkEmail::Models::Tenants::CredentialListResponse::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ArkEmail::Models::Tenants::CredentialListResponse::Type::TaggedSymbol
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
