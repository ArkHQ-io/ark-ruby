# typed: strong

module ArkEmail
  module Models
    module Tenants
      class CredentialUpdateParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::CredentialUpdateParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        # Set to `true` to disable the credential (put on hold). Set to `false` to enable
        # the credential (release from hold).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :hold

        sig { params(hold: T::Boolean).void }
        attr_writer :hold

        # New name for the credential
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig do
          params(
            tenant_id: String,
            hold: T::Boolean,
            name: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          # Set to `true` to disable the credential (put on hold). Set to `false` to enable
          # the credential (release from hold).
          hold: nil,
          # New name for the credential
          name: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              hold: T::Boolean,
              name: String,
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
