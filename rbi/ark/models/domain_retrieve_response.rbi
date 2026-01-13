# typed: strong

module Ark
  module Models
    class DomainRetrieveResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::DomainRetrieveResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::DomainRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::DomainRetrieveResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig do
        returns(Ark::Models::DomainRetrieveResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::DomainRetrieveResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: Ark::Models::DomainRetrieveResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success:)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::DomainRetrieveResponse::Data,
            meta: Ark::APIMeta,
            success: Ark::Models::DomainRetrieveResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::DomainRetrieveResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Domain ID
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(Ark::Models::DomainRetrieveResponse::Data::DNSRecords) }
        attr_reader :dns_records

        sig do
          params(
            dns_records:
              Ark::Models::DomainRetrieveResponse::Data::DNSRecords::OrHash
          ).void
        end
        attr_writer :dns_records

        # Domain name
        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :uuid

        # Whether DNS is verified
        sig { returns(T::Boolean) }
        attr_accessor :verified

        # When the domain was verified (null if not verified)
        sig { returns(T.nilable(Time)) }
        attr_accessor :verified_at

        sig do
          params(
            id: String,
            created_at: Time,
            dns_records:
              Ark::Models::DomainRetrieveResponse::Data::DNSRecords::OrHash,
            name: String,
            uuid: String,
            verified: T::Boolean,
            verified_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Domain ID
          id:,
          created_at:,
          dns_records:,
          # Domain name
          name:,
          uuid:,
          # Whether DNS is verified
          verified:,
          # When the domain was verified (null if not verified)
          verified_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              dns_records:
                Ark::Models::DomainRetrieveResponse::Data::DNSRecords,
              name: String,
              uuid: String,
              verified: T::Boolean,
              verified_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        class DNSRecords < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::DomainRetrieveResponse::Data::DNSRecords,
                Ark::Internal::AnyHash
              )
            end

          sig { returns(Ark::DNSRecord) }
          attr_reader :dkim

          sig { params(dkim: Ark::DNSRecord::OrHash).void }
          attr_writer :dkim

          sig { returns(Ark::DNSRecord) }
          attr_reader :return_path

          sig { params(return_path: Ark::DNSRecord::OrHash).void }
          attr_writer :return_path

          sig { returns(Ark::DNSRecord) }
          attr_reader :spf

          sig { params(spf: Ark::DNSRecord::OrHash).void }
          attr_writer :spf

          sig do
            params(
              dkim: Ark::DNSRecord::OrHash,
              return_path: Ark::DNSRecord::OrHash,
              spf: Ark::DNSRecord::OrHash
            ).returns(T.attached_class)
          end
          def self.new(dkim:, return_path:, spf:)
          end

          sig do
            override.returns(
              {
                dkim: Ark::DNSRecord,
                return_path: Ark::DNSRecord,
                spf: Ark::DNSRecord
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
            T.all(T::Boolean, Ark::Models::DomainRetrieveResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Ark::Models::DomainRetrieveResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Ark::Models::DomainRetrieveResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
