# typed: strong

module Ark
  module Models
    class DomainListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::DomainListResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::DomainListResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::DomainListResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(Ark::Models::DomainListResponse::Success::TaggedBoolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::DomainListResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::DomainListResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::DomainListResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::DomainListResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Ark::Models::DomainListResponse::Data, Ark::Internal::AnyHash)
          end

        sig { returns(T::Array[Ark::Models::DomainListResponse::Data::Domain]) }
        attr_accessor :domains

        sig do
          params(
            domains:
              T::Array[Ark::Models::DomainListResponse::Data::Domain::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(domains:)
        end

        sig do
          override.returns(
            { domains: T::Array[Ark::Models::DomainListResponse::Data::Domain] }
          )
        end
        def to_hash
        end

        class Domain < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::DomainListResponse::Data::Domain,
                Ark::Internal::AnyHash
              )
            end

          # Domain ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :dns_ok

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T::Boolean) }
          attr_accessor :verified

          sig do
            params(
              id: String,
              dns_ok: T::Boolean,
              name: String,
              verified: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Domain ID
            id:,
            dns_ok:,
            name:,
            verified:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                dns_ok: T::Boolean,
                name: String,
                verified: T::Boolean
              }
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
            T.all(T::Boolean, Ark::Models::DomainListResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(true, Ark::Models::DomainListResponse::Success::TaggedBoolean)

        sig do
          override.returns(
            T::Array[Ark::Models::DomainListResponse::Success::TaggedBoolean]
          )
        end
        def self.values
        end
      end
    end
  end
end
