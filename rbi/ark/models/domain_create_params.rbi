# typed: strong

module Ark
  module Models
    class DomainCreateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(Ark::DomainCreateParams, Ark::Internal::AnyHash) }

      # Domain name (e.g., "mail.example.com")
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          name: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain name (e.g., "mail.example.com")
        name:,
        request_options: {}
      )
      end

      sig do
        override.returns({ name: String, request_options: Ark::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
