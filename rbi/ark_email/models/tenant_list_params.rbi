# typed: strong

module ArkEmail
  module Models
    class TenantListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::TenantListParams, ArkEmail::Internal::AnyHash)
        end

      # Page number (1-indexed)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Number of items per page (max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :per_page

      sig { params(per_page: Integer).void }
      attr_writer :per_page

      # Filter by tenant status
      sig { returns(T.nilable(ArkEmail::TenantListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ArkEmail::TenantListParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          page: Integer,
          per_page: Integer,
          status: ArkEmail::TenantListParams::Status::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number (1-indexed)
        page: nil,
        # Number of items per page (max 100)
        per_page: nil,
        # Filter by tenant status
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            per_page: Integer,
            status: ArkEmail::TenantListParams::Status::OrSymbol,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::TenantListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ArkEmail::TenantListParams::Status::TaggedSymbol)
        SUSPENDED =
          T.let(:suspended, ArkEmail::TenantListParams::Status::TaggedSymbol)
        ARCHIVED =
          T.let(:archived, ArkEmail::TenantListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::TenantListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
