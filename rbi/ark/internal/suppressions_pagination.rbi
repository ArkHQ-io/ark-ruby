# typed: strong

module Ark
  module Internal
    class SuppressionsPagination
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

        sig { returns(T.nilable(Data::Pagination)) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig { returns(T.nilable(T::Array[Data::Suppression])) }
        attr_reader :suppressions

        sig { params(suppressions: T::Array[Data::Suppression::OrHash]).void }
        attr_writer :suppressions

        sig do
          params(
            pagination: Data::Pagination::OrHash,
            suppressions: T::Array[Data::Suppression::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(pagination: nil, suppressions: nil)
        end

        sig do
          override.returns(
            {
              pagination: Data::Pagination,
              suppressions: T::Array[Data::Suppression]
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

        class Suppression < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(Data::Suppression, Ark::Internal::AnyHash) }

          # Suppression ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :address

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          sig do
            params(
              id: String,
              address: String,
              created_at: Time,
              reason: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Suppression ID
            id:,
            address:,
            created_at:,
            reason: nil
          )
          end

          sig do
            override.returns(
              { id: String, address: String, created_at: Time, reason: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
