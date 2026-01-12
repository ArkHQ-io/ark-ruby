# typed: strong

module Ark
  module Models
    class SuppressionListParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Ark::SuppressionListParams, Ark::Internal::AnyHash)
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      sig { returns(T.nilable(Integer)) }
      attr_reader :per_page

      sig { params(per_page: Integer).void }
      attr_writer :per_page

      sig do
        params(
          page: Integer,
          per_page: Integer,
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(page: nil, per_page: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            page: Integer,
            per_page: Integer,
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
