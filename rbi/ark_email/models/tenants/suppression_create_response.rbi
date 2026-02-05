# typed: strong

module ArkEmail
  module Models
    module Tenants
      class SuppressionCreateResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::SuppressionCreateResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(ArkEmail::Models::Tenants::SuppressionCreateResponse::Data)
        end
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Tenants::SuppressionCreateResponse::Data::OrHash
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
              ArkEmail::Models::Tenants::SuppressionCreateResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::SuppressionCreateResponse::Data,
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
                ArkEmail::Models::Tenants::SuppressionCreateResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Suppression ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :address

          sig { returns(Time) }
          attr_accessor :created_at

          # Reason for suppression
          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          sig do
            params(
              id: String,
              address: String,
              created_at: Time,
              reason: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Suppression ID
            id:,
            address:,
            created_at:,
            # Reason for suppression
            reason: nil
          )
          end

          sig do
            override.returns(
              { id: String, address: String, created_at: Time, reason: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
