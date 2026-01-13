# typed: strong

module Ark
  module Internal
    class SuppressionsPage
      include Ark::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig { returns(Data) }
      attr_accessor :data

      sig { returns(Meta) }
      attr_accessor :meta

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Data, Ark::Internal::AnyHash) }

        sig { returns(Data::Pagination) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
        attr_accessor :suppressions

        sig do
          params(
            pagination: Data::Pagination::OrHash,
            suppressions: T::Array[T::Hash[Symbol, T.anything]]
          ).returns(T.attached_class)
        end
        def self.new(pagination:, suppressions:)
        end

        sig do
          override.returns(
            {
              pagination: Data::Pagination,
              suppressions: T::Array[T::Hash[Symbol, T.anything]]
            }
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
          attr_reader :per_page

          sig { params(per_page: Integer).void }
          attr_writer :per_page

          sig { returns(T.nilable(Integer)) }
          attr_reader :total

          sig { params(total: Integer).void }
          attr_writer :total

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          sig do
            params(
              page: Integer,
              per_page: Integer,
              total: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(page: nil, per_page: nil, total: nil, total_pages: nil)
          end

          sig do
            override.returns(
              {
                page: Integer,
                per_page: Integer,
                total: Integer,
                total_pages: Integer
              }
            )
          end
          def to_hash
          end
        end
      end

      class Meta < Ark::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Meta, Ark::Internal::AnyHash) }

        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        sig { params(request_id: String).returns(T.attached_class) }
        def self.new(request_id: nil)
        end

        sig { override.returns({ request_id: String }) }
        def to_hash
        end
      end
    end
  end
end
