# typed: strong

module ArkEmail
  module Models
    class DomainListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::DomainListParams, ArkEmail::Internal::AnyHash)
        end

      # Filter domains by tenant ID
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      sig do
        params(
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter domains by tenant ID
        tenant_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { tenant_id: String, request_options: ArkEmail::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
