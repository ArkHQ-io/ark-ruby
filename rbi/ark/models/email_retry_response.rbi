# typed: strong

module Ark
  module Models
    class EmailRetryResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailRetryResponse, Ark::Internal::AnyHash)
        end

      sig { returns(T.nilable(Ark::Models::EmailRetryResponse::Data)) }
      attr_reader :data

      sig { params(data: Ark::Models::EmailRetryResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      sig do
        params(
          data: Ark::Models::EmailRetryResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data: nil, success: nil)
      end

      sig do
        override.returns(
          { data: Ark::Models::EmailRetryResponse::Data, success: T::Boolean }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Ark::Models::EmailRetryResponse::Data, Ark::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig { params(message: String).returns(T.attached_class) }
        def self.new(message: nil)
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end
    end
  end
end
