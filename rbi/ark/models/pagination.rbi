# typed: strong

module Ark
  module Models
    class Pagination < Ark::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Ark::Pagination, Ark::Internal::AnyHash) }

      # Current page number (1-indexed)
      sig { returns(Integer) }
      attr_accessor :page

      # Items per page
      sig { returns(Integer) }
      attr_accessor :per_page

      # Total number of items
      sig { returns(Integer) }
      attr_accessor :total

      # Total number of pages
      sig { returns(Integer) }
      attr_accessor :total_pages

      sig do
        params(
          page: Integer,
          per_page: Integer,
          total: Integer,
          total_pages: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Current page number (1-indexed)
        page:,
        # Items per page
        per_page:,
        # Total number of items
        total:,
        # Total number of pages
        total_pages:
      )
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
end
