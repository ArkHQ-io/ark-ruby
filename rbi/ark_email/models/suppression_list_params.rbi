# typed: strong

module ArkEmail
  module Models
    class SuppressionListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::SuppressionListParams, ArkEmail::Internal::AnyHash)
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
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(page: nil, per_page: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            page: Integer,
            per_page: Integer,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
