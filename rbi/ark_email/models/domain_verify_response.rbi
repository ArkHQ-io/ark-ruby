# typed: strong

module ArkEmail
  module Models
    class DomainVerifyResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::DomainVerifyResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::DomainVerifyResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::DomainVerifyResponse::Data::OrHash).void
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
          data: ArkEmail::Models::DomainVerifyResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::DomainVerifyResponse::Data,
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
              ArkEmail::Models::DomainVerifyResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Domain ID
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          returns(ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords)
        end
        attr_reader :dns_records

        sig do
          params(
            dns_records:
              ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords::OrHash
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
              ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords::OrHash,
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
                ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords,
              name: String,
              uuid: String,
              verified: T::Boolean,
              verified_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        class DNSRecords < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords,
                ArkEmail::Internal::AnyHash
              )
            end

          sig { returns(ArkEmail::DNSRecord) }
          attr_reader :dkim

          sig { params(dkim: ArkEmail::DNSRecord::OrHash).void }
          attr_writer :dkim

          sig { returns(ArkEmail::DNSRecord) }
          attr_reader :return_path

          sig { params(return_path: ArkEmail::DNSRecord::OrHash).void }
          attr_writer :return_path

          sig { returns(ArkEmail::DNSRecord) }
          attr_reader :spf

          sig { params(spf: ArkEmail::DNSRecord::OrHash).void }
          attr_writer :spf

          sig do
            params(
              dkim: ArkEmail::DNSRecord::OrHash,
              return_path: ArkEmail::DNSRecord::OrHash,
              spf: ArkEmail::DNSRecord::OrHash
            ).returns(T.attached_class)
          end
          def self.new(dkim:, return_path:, spf:)
          end

          sig do
            override.returns(
              {
                dkim: ArkEmail::DNSRecord,
                return_path: ArkEmail::DNSRecord,
                spf: ArkEmail::DNSRecord
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
