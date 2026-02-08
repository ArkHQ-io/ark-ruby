# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialCreateResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::CredentialCreateResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(ArkEmail::Models::Tenants::CredentialCreateResponse::Data)
        end
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Tenants::CredentialCreateResponse::Data::OrHash
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
            data:
              ArkEmail::Models::Tenants::CredentialCreateResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::CredentialCreateResponse::Data,
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
                ArkEmail::Models::Tenants::CredentialCreateResponse::Data,
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

          # The credential key (secret). **Store this securely** - it will not be shown
          # again unless you use the reveal parameter.
          sig { returns(String) }
          attr_accessor :key

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
              ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # When the credential was last updated
          sig { returns(Time) }
          attr_accessor :updated_at

          # SMTP username for authentication. Only included for SMTP credentials. Format:
          # `{tenantId}/{key}`
          sig { returns(T.nilable(String)) }
          attr_reader :smtp_username

          sig { params(smtp_username: String).void }
          attr_writer :smtp_username

          sig do
            params(
              id: Integer,
              created_at: Time,
              hold: T::Boolean,
              key: String,
              last_used_at: T.nilable(Time),
              name: String,
              type:
                ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type::OrSymbol,
              updated_at: Time,
              smtp_username: String
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
            # The credential key (secret). **Store this securely** - it will not be shown
            # again unless you use the reveal parameter.
            key:,
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
            updated_at:,
            # SMTP username for authentication. Only included for SMTP credentials. Format:
            # `{tenantId}/{key}`
            smtp_username: nil
          )
          end

          sig do
            override.returns(
              {
                id: Integer,
                created_at: Time,
                hold: T::Boolean,
                key: String,
                last_used_at: T.nilable(Time),
                name: String,
                type:
                  ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type::TaggedSymbol,
                updated_at: Time,
                smtp_username: String
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
                  ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SMTP =
              T.let(
                :smtp,
                ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type::TaggedSymbol
              )
            API =
              T.let(
                :api,
                ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::Tenants::CredentialCreateResponse::Data::Type::TaggedSymbol
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
end
