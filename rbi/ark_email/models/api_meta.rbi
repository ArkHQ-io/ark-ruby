# typed: strong

module ArkEmail
  module Models
    class APIMeta < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(ArkEmail::APIMeta, ArkEmail::Internal::AnyHash) }

      # Unique request identifier for debugging and support
      sig { returns(String) }
      attr_accessor :request_id

      sig { params(request_id: String).returns(T.attached_class) }
      def self.new(
        # Unique request identifier for debugging and support
        request_id:
      )
      end

      sig { override.returns({ request_id: String }) }
      def to_hash
      end
    end
  end
end
