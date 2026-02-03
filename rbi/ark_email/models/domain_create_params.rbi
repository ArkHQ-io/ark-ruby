# typed: strong

module ArkEmail
  module Models
    class DomainCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::DomainCreateParams, ArkEmail::Internal::AnyHash)
        end

      # Domain name (e.g., "mail.example.com")
      sig { returns(String) }
      attr_accessor :name

      # ID of the tenant this domain belongs to
      sig { returns(String) }
      attr_accessor :tenant_id

      sig do
        params(
          name: String,
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain name (e.g., "mail.example.com")
        name:,
        # ID of the tenant this domain belongs to
        tenant_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
