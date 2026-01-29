# typed: strong

module ArkEmail
  module Models
    class DomainListResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::DomainListResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::DomainListResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::DomainListResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: ArkEmail::Models::DomainListResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::DomainListResponse::Data,
            meta: ArkEmail::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::DomainListResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(T::Array[ArkEmail::Models::DomainListResponse::Data::Domain])
        end
        attr_accessor :domains

        sig do
          params(
            domains:
              T::Array[
                ArkEmail::Models::DomainListResponse::Data::Domain::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(domains:)
        end

        sig do
          override.returns(
            {
              domains:
                T::Array[ArkEmail::Models::DomainListResponse::Data::Domain]
            }
          )
        end
        def to_hash
        end

        class Domain < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::DomainListResponse::Data::Domain,
                ArkEmail::Internal::AnyHash
              )
            end

          # Unique domain identifier
          sig { returns(Integer) }
          attr_accessor :id

          # The domain name used for sending emails
          sig { returns(String) }
          attr_accessor :name

          # Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
          # Domain must be verified before sending emails.
          sig { returns(T::Boolean) }
          attr_accessor :verified

          sig do
            params(id: Integer, name: String, verified: T::Boolean).returns(
              T.attached_class
            )
          end
          def self.new(
            # Unique domain identifier
            id:,
            # The domain name used for sending emails
            name:,
            # Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
            # Domain must be verified before sending emails.
            verified:
          )
          end

          sig do
            override.returns(
              { id: Integer, name: String, verified: T::Boolean }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
