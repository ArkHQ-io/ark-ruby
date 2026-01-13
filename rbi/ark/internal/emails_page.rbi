# typed: strong

module Ark
  module Internal
    class EmailsPage
      include Ark::Internal::Type::BasePage

      Elem = type_member

      sig { returns(Data) }
      attr_accessor :data

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Data, Ark::Internal::AnyHash) }

        sig { returns(T.nilable(T::Array[T.anything])) }
        attr_reader :messages

        sig { params(messages: T::Array[T.anything]).void }
        attr_writer :messages

        sig { returns(T.nilable(Data::Pagination)) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig do
          params(
            messages: T::Array[T.anything],
            pagination: Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(messages: nil, pagination: nil)
        end

        sig do
          override.returns(
            { messages: T::Array[T.anything], pagination: Data::Pagination }
          )
        end
        def to_hash
        end

        class Pagination < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(Data::Pagination, Ark::Internal::AnyHash) }

          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          sig do
            params(page: Integer, total_pages: Integer).returns(
              T.attached_class
            )
          end
          def self.new(page: nil, total_pages: nil)
          end

          sig { override.returns({ page: Integer, total_pages: Integer }) }
          def to_hash
          end
        end
      end
    end
  end
end
