# typed: strong

module Ark
  module Models
    class SuppressionListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::SuppressionListResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::SuppressionListResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::SuppressionListResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::SuppressionListResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::SuppressionListResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::SuppressionListResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::SuppressionListResponse::Data,
            meta: Ark::APIMeta,
            success:
              Ark::Models::SuppressionListResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::SuppressionListResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig { returns(Ark::Models::SuppressionListResponse::Data::Pagination) }
        attr_reader :pagination

        sig do
          params(
            pagination:
              Ark::Models::SuppressionListResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        sig do
          returns(
            T::Array[Ark::Models::SuppressionListResponse::Data::Suppression]
          )
        end
        attr_accessor :suppressions

        sig do
          params(
            pagination:
              Ark::Models::SuppressionListResponse::Data::Pagination::OrHash,
            suppressions:
              T::Array[
                Ark::Models::SuppressionListResponse::Data::Suppression::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(pagination:, suppressions:)
        end

        sig do
          override.returns(
            {
              pagination:
                Ark::Models::SuppressionListResponse::Data::Pagination,
              suppressions:
                T::Array[
                  Ark::Models::SuppressionListResponse::Data::Suppression
                ]
            }
          )
        end
        def to_hash
        end

        class Pagination < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::SuppressionListResponse::Data::Pagination,
                Ark::Internal::AnyHash
              )
            end

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

        class Suppression < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::SuppressionListResponse::Data::Suppression,
                Ark::Internal::AnyHash
              )
            end

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

      module Success
        extend Ark::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Ark::Models::SuppressionListResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::SuppressionListResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::SuppressionListResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
