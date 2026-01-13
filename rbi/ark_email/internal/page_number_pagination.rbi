# typed: strong

module ArkEmail
  module Internal
    class PageNumberPagination
      include ArkEmail::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :data

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :per_page

      sig { returns(Integer) }
      attr_accessor :total

      sig { returns(Integer) }
      attr_accessor :total_pages

      sig { returns(Meta) }
      attr_accessor :meta

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Meta < ArkEmail::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Meta, ArkEmail::Internal::AnyHash) }

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
