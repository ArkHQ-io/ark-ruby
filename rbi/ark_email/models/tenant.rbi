# typed: strong

module ArkEmail
  module Models
    class Tenant < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(ArkEmail::Tenant, ArkEmail::Internal::AnyHash) }

      # Unique identifier for the tenant
      sig { returns(String) }
      attr_accessor :id

      # When the tenant was created
      sig { returns(Time) }
      attr_accessor :created_at

      # Custom key-value pairs for storing additional data
      sig do
        returns(
          T::Hash[Symbol, T.nilable(ArkEmail::Tenant::Metadata::Variants)]
        )
      end
      attr_accessor :metadata

      # Display name for the tenant
      sig { returns(String) }
      attr_accessor :name

      # Current status of the tenant:
      #
      # - `active` - Normal operation
      # - `suspended` - Temporarily disabled
      # - `archived` - Soft-deleted
      sig { returns(ArkEmail::Tenant::Status::TaggedSymbol) }
      attr_accessor :status

      # When the tenant was last updated
      sig { returns(Time) }
      attr_accessor :updated_at

      sig do
        params(
          id: String,
          created_at: Time,
          metadata:
            T::Hash[Symbol, T.nilable(ArkEmail::Tenant::Metadata::Variants)],
          name: String,
          status: ArkEmail::Tenant::Status::OrSymbol,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the tenant
        id:,
        # When the tenant was created
        created_at:,
        # Custom key-value pairs for storing additional data
        metadata:,
        # Display name for the tenant
        name:,
        # Current status of the tenant:
        #
        # - `active` - Normal operation
        # - `suspended` - Temporarily disabled
        # - `archived` - Soft-deleted
        status:,
        # When the tenant was last updated
        updated_at:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            metadata:
              T::Hash[Symbol, T.nilable(ArkEmail::Tenant::Metadata::Variants)],
            name: String,
            status: ArkEmail::Tenant::Status::TaggedSymbol,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      module Metadata
        extend ArkEmail::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Float, T::Boolean) }

        sig { override.returns(T::Array[ArkEmail::Tenant::Metadata::Variants]) }
        def self.variants
        end
      end

      # Current status of the tenant:
      #
      # - `active` - Normal operation
      # - `suspended` - Temporarily disabled
      # - `archived` - Soft-deleted
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, ArkEmail::Tenant::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE = T.let(:active, ArkEmail::Tenant::Status::TaggedSymbol)
        SUSPENDED = T.let(:suspended, ArkEmail::Tenant::Status::TaggedSymbol)
        ARCHIVED = T.let(:archived, ArkEmail::Tenant::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[ArkEmail::Tenant::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
