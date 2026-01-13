# typed: strong

module Ark
  module Internal
    class PageNumber
      include Ark::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :messages

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
