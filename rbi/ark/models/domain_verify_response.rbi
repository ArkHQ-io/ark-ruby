# typed: strong

module Ark
  module Models
    class DomainVerifyResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::DomainVerifyResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::DomainVerifyResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::DomainVerifyResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::DomainVerifyResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::DomainVerifyResponse::Data,
            meta: Ark::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::DomainVerifyResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Domain ID
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(Ark::Models::DomainVerifyResponse::Data::DNSRecords) }
        attr_reader :dns_records

        sig do
          params(
            dns_records:
              Ark::Models::DomainVerifyResponse::Data::DNSRecords::OrHash
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
              Ark::Models::DomainVerifyResponse::Data::DNSRecords::OrHash,
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
              dns_records: Ark::Models::DomainVerifyResponse::Data::DNSRecords,
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
                Ark::Models::DomainVerifyResponse::Data::DNSRecords,
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
    end
  end
end
