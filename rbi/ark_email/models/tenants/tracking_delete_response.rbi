# typed: strong

module ArkEmail
  module Models
    module Tenants
      class TrackingDeleteResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Tenants::TrackingDeleteResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(ArkEmail::Models::Tenants::TrackingDeleteResponse::Data) }
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Tenants::TrackingDeleteResponse::Data::OrHash
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
              ArkEmail::Models::Tenants::TrackingDeleteResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data: ArkEmail::Models::Tenants::TrackingDeleteResponse::Data,
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
                ArkEmail::Models::Tenants::TrackingDeleteResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :message

          sig { params(message: String).returns(T.attached_class) }
          def self.new(message:)
          end

          sig { override.returns({ message: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
