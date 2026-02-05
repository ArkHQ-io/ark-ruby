# typed: strong

module ArkEmail
  module Models
    module Tenants
      class TrackingUpdateResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::TrackingUpdateResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Tenants::TrackDomain) }
        attr_reader :data

        sig { params(data: ArkEmail::Tenants::TrackDomain::OrHash).void }
        attr_writer :data

        sig { returns(ArkEmail::APIMeta) }
        attr_reader :meta

        sig { params(meta: ArkEmail::APIMeta::OrHash).void }
        attr_writer :meta

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            data: ArkEmail::Tenants::TrackDomain::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Tenants::TrackDomain,
              meta: ArkEmail::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
