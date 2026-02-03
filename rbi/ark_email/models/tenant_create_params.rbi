# typed: strong

module ArkEmail
  module Models
    class TenantCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::TenantCreateParams, ArkEmail::Internal::AnyHash)
        end

      # Display name for the tenant (e.g., your customer's company name)
      sig { returns(String) }
      attr_accessor :name

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
              T.nilable(ArkEmail::TenantCreateParams::Metadata::Variants)
            ]
          )
        )
      end
      attr_accessor :metadata

      sig do
        params(
          name: String,
          metadata:
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(ArkEmail::TenantCreateParams::Metadata::Variants)
              ]
            ),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Display name for the tenant (e.g., your customer's company name)
        name:,
        # Custom key-value pairs. Useful for storing references to your internal systems.
        #
        # **Limits:**
        #
        # - Max 50 keys
        # - Key names max 40 characters
        # - String values max 500 characters
        # - Total size max 8KB
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            metadata:
              T.nilable(
                T::Hash[
                  Symbol,
                  T.nilable(ArkEmail::TenantCreateParams::Metadata::Variants)
                ]
              ),
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
            T::Array[ArkEmail::TenantCreateParams::Metadata::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
