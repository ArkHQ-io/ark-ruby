# typed: strong

module ArkEmail
  module Internal
    class OffsetPagination
      include ArkEmail::Internal::Type::BasePage

      Elem = type_member

      sig { returns(Data) }
      attr_accessor :data

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Data, ArkEmail::Internal::AnyHash) }

        sig { returns(T.nilable(Data::Pagination)) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_reader :tenants

        sig { params(tenants: T::Array[T::Hash[Symbol, T.anything]]).void }
        attr_writer :tenants

        sig do
          params(
            pagination: Data::Pagination::OrHash,
            tenants: T::Array[T::Hash[Symbol, T.anything]]
          ).returns(T.attached_class)
        end
        def self.new(pagination: nil, tenants: nil)
        end

        sig do
          override.returns(
            {
              pagination: Data::Pagination,
              tenants: T::Array[T::Hash[Symbol, T.anything]]
            }
          )
        end
        def to_hash
        end

        class Pagination < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Data::Pagination, ArkEmail::Internal::AnyHash)
            end

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_more

          sig { params(has_more: T::Boolean).void }
          attr_writer :has_more

          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          sig { returns(T.nilable(Integer)) }
          attr_reader :offset

          sig { params(offset: Integer).void }
          attr_writer :offset

          sig { returns(T.nilable(Integer)) }
          attr_reader :total

          sig { params(total: Integer).void }
          attr_writer :total

          sig do
            params(
              has_more: T::Boolean,
              limit: Integer,
              offset: Integer,
              total: Integer
            ).returns(T.attached_class)
          end
          def self.new(has_more: nil, limit: nil, offset: nil, total: nil)
          end

          sig do
            override.returns(
              {
                has_more: T::Boolean,
                limit: Integer,
                offset: Integer,
                total: Integer
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
