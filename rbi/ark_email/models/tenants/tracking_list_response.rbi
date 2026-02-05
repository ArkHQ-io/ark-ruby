# typed: strong

module ArkEmail
  module Models
    module Tenants
      class TrackingListResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::TrackingListResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Models::Tenants::TrackingListResponse::Data) }
        attr_reader :data

        sig do
          params(
            data: ArkEmail::Models::Tenants::TrackingListResponse::Data::OrHash
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
            data: ArkEmail::Models::Tenants::TrackingListResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::TrackingListResponse::Data,
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
                ArkEmail::Models::Tenants::TrackingListResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          sig { returns(T::Array[ArkEmail::Tenants::TrackDomain]) }
          attr_accessor :track_domains

          sig do
            params(
              track_domains: T::Array[ArkEmail::Tenants::TrackDomain::OrHash]
            ).returns(T.attached_class)
          end
          def self.new(track_domains:)
          end

          sig do
            override.returns(
              { track_domains: T::Array[ArkEmail::Tenants::TrackDomain] }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
