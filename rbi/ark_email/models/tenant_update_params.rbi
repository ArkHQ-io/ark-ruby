# typed: strong

module ArkEmail
  module Models
    class TenantUpdateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::TenantUpdateParams, ArkEmail::Internal::AnyHash)
        end

      # Custom key-value pairs. Useful for storing references to your internal systems.
      #
      # **Limits:**
      #
      # - Max 50 keys
      # - Key names max 40 characters
      # - String values max 500 characters
      # - Total size max 8KB
      sig do
        returns(
          T.nilable(
            T::Hash[
              Symbol,
              T.nilable(ArkEmail::TenantUpdateParams::Metadata::Variants)
            ]
          )
        )
      end
      attr_accessor :metadata

      # Display name for the tenant
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Tenant status
      sig { returns(T.nilable(ArkEmail::TenantUpdateParams::Status::OrSymbol)) }
      attr_reader :status

      sig do
        params(status: ArkEmail::TenantUpdateParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          metadata:
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(ArkEmail::TenantUpdateParams::Metadata::Variants)
              ]
            ),
          name: String,
          status: ArkEmail::TenantUpdateParams::Status::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Custom key-value pairs. Useful for storing references to your internal systems.
        #
        # **Limits:**
        #
        # - Max 50 keys
        # - Key names max 40 characters
        # - String values max 500 characters
        # - Total size max 8KB
        metadata: nil,
        # Display name for the tenant
        name: nil,
        # Tenant status
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            metadata:
              T.nilable(
                T::Hash[
                  Symbol,
                  T.nilable(ArkEmail::TenantUpdateParams::Metadata::Variants)
                ]
              ),
            name: String,
            status: ArkEmail::TenantUpdateParams::Status::OrSymbol,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Metadata
        extend ArkEmail::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Float, T::Boolean) }

        sig do
          override.returns(
            T::Array[ArkEmail::TenantUpdateParams::Metadata::Variants]
          )
        end
        def self.variants
        end
      end

      # Tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::TenantUpdateParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ArkEmail::TenantUpdateParams::Status::TaggedSymbol)
        SUSPENDED =
          T.let(:suspended, ArkEmail::TenantUpdateParams::Status::TaggedSymbol)
        ARCHIVED =
          T.let(:archived, ArkEmail::TenantUpdateParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::TenantUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
