# typed: strong

module ArkEmail
  module Models
    class TrackingRetrieveParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::TrackingRetrieveParams, ArkEmail::Internal::AnyHash)
        end

      sig do
        params(request_options: ArkEmail::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: ArkEmail::RequestOptions }) }
      def to_hash
      end
    end
  end
end
