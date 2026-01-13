# typed: strong

module Ark
  module Internal
    class SuppressionsPage
      include Ark::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :suppressions

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
