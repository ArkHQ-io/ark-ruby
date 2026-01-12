# typed: strong

module Ark
  module Models
    class SuppressionDeleteParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Ark::SuppressionDeleteParams, Ark::Internal::AnyHash)
        end

      sig do
        params(request_options: Ark::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Ark::RequestOptions }) }
      def to_hash
      end
    end
  end
end
