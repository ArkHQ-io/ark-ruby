# typed: strong

module ArkEmail
  module Models
    module Tenants
      class SuppressionListResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::SuppressionListResponse,
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
