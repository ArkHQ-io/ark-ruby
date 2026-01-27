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

        # Unique domain identifier
        sig { returns(Integer) }
        attr_accessor :id

        # Timestamp when the domain was added
        sig { returns(Time) }
        attr_accessor :created_at

        # DNS records that must be added to your domain's DNS settings. Null if records
        # are not yet generated.
        sig do
          returns(
            T.nilable(ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords)
          )
        end
        attr_reader :dns_records

        sig do
          params(
            dns_records:
              T.nilable(
                ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords::OrHash
              )
          ).void
        end
        attr_writer :dns_records

        # The domain name used for sending emails
        sig { returns(String) }
        attr_accessor :name

        # UUID of the domain
        sig { returns(String) }
        attr_accessor :uuid

        # Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
        # Domain must be verified before sending emails.
        sig { returns(T::Boolean) }
        attr_accessor :verified

        # Timestamp when the domain ownership was verified, or null if not yet verified
        sig { returns(T.nilable(Time)) }
        attr_accessor :verified_at

        sig do
          params(
            id: Integer,
            created_at: Time,
            dns_records:
              T.nilable(
                ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords::OrHash
              ),
            name: String,
            uuid: String,
            verified: T::Boolean,
            verified_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique domain identifier
          id:,
          # Timestamp when the domain was added
          created_at:,
          # DNS records that must be added to your domain's DNS settings. Null if records
          # are not yet generated.
          dns_records:,
          # The domain name used for sending emails
          name:,
          # UUID of the domain
          uuid:,
          # Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
          # Domain must be verified before sending emails.
          verified:,
          # Timestamp when the domain ownership was verified, or null if not yet verified
          verified_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: Integer,
              created_at: Time,
              dns_records:
                T.nilable(
                  ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords
                ),
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

          # A DNS record that needs to be configured in your domain's DNS settings
          sig { returns(T.nilable(ArkEmail::DNSRecord)) }
          attr_reader :dkim

          sig { params(dkim: T.nilable(ArkEmail::DNSRecord::OrHash)).void }
          attr_writer :dkim

          # A DNS record that needs to be configured in your domain's DNS settings
          sig { returns(T.nilable(ArkEmail::DNSRecord)) }
          attr_reader :return_path

          sig do
            params(return_path: T.nilable(ArkEmail::DNSRecord::OrHash)).void
          end
          attr_writer :return_path

          # A DNS record that needs to be configured in your domain's DNS settings
          sig { returns(T.nilable(ArkEmail::DNSRecord)) }
          attr_reader :spf

          sig { params(spf: T.nilable(ArkEmail::DNSRecord::OrHash)).void }
          attr_writer :spf

          # DNS records that must be added to your domain's DNS settings. Null if records
          # are not yet generated.
          sig do
            params(
              dkim: T.nilable(ArkEmail::DNSRecord::OrHash),
              return_path: T.nilable(ArkEmail::DNSRecord::OrHash),
              spf: T.nilable(ArkEmail::DNSRecord::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(
            # A DNS record that needs to be configured in your domain's DNS settings
            dkim: nil,
            # A DNS record that needs to be configured in your domain's DNS settings
            return_path: nil,
            # A DNS record that needs to be configured in your domain's DNS settings
            spf: nil
          )
          end

          sig do
            override.returns(
              {
                dkim: T.nilable(ArkEmail::DNSRecord),
                return_path: T.nilable(ArkEmail::DNSRecord),
                spf: T.nilable(ArkEmail::DNSRecord)
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
