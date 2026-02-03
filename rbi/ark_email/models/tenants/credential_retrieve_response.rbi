# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialRetrieveResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::CredentialRetrieveResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data)
        end
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::OrHash
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
              ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data,
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
                ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data,
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
              ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # When the credential was last updated
          sig { returns(Time) }
          attr_accessor :updated_at

          # The credential key (secret). Only included when:
          #
          # - Creating a new credential (always returned)
          # - Retrieving with `reveal=true`
          sig { returns(T.nilable(String)) }
          attr_reader :key

          sig { params(key: String).void }
          attr_writer :key

          # SMTP username for authentication. Only included for SMTP credentials when the
          # key is revealed.
          sig { returns(T.nilable(String)) }
          attr_reader :smtp_username

          sig { params(smtp_username: String).void }
          attr_writer :smtp_username

          sig do
            params(
              id: Integer,
              created_at: Time,
              hold: T::Boolean,
              last_used_at: T.nilable(Time),
              name: String,
              type:
                ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type::OrSymbol,
              updated_at: Time,
              key: String,
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
            # The credential key (secret). Only included when:
            #
            # - Creating a new credential (always returned)
            # - Retrieving with `reveal=true`
            key: nil,
            # SMTP username for authentication. Only included for SMTP credentials when the
            # key is revealed.
            smtp_username: nil
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
                  ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type::TaggedSymbol,
                updated_at: Time,
                key: String,
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
                  ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SMTP =
              T.let(
                :smtp,
                ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type::TaggedSymbol
              )
            API =
              T.let(
                :api,
                ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::Tenants::CredentialRetrieveResponse::Data::Type::TaggedSymbol
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
