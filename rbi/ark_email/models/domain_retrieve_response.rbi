# typed: strong

module ArkEmail
  module Models
    class DomainRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::DomainRetrieveResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      sig { returns(ArkEmail::Models::DomainRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: ArkEmail::Models::DomainRetrieveResponse::Data::OrHash
        ).void
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
          data: ArkEmail::Models::DomainRetrieveResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::DomainRetrieveResponse::Data,
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
              ArkEmail::Models::DomainRetrieveResponse::Data,
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
        #
        # **Important:** The `name` field contains the relative hostname that you should
        # enter in your DNS provider. Most DNS providers auto-append the zone name, so you
        # only need to enter the relative part.
        #
        # For subdomains like `mail.example.com`, the zone is `example.com`, so:
        #
        # - SPF `name` would be `mail` (not `@`)
        # - DKIM `name` would be `ark-xyz._domainkey.mail`
        # - Return Path `name` would be `psrp.mail`
        sig do
          returns(
            T.nilable(
              ArkEmail::Models::DomainRetrieveResponse::Data::DNSRecords
            )
          )
        end
        attr_reader :dns_records

        sig do
          params(
            dns_records:
              T.nilable(
                ArkEmail::Models::DomainRetrieveResponse::Data::DNSRecords::OrHash
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

        # ID of the tenant this domain belongs to
        sig { returns(T.nilable(String)) }
        attr_reader :tenant_id

        sig { params(tenant_id: String).void }
        attr_writer :tenant_id

        # Name of the tenant this domain belongs to
        sig { returns(T.nilable(String)) }
        attr_reader :tenant_name

        sig { params(tenant_name: String).void }
        attr_writer :tenant_name

        # Timestamp when the domain ownership was verified, or null if not yet verified
        sig { returns(T.nilable(Time)) }
        attr_accessor :verified_at

        sig do
          params(
            id: Integer,
            created_at: Time,
            dns_records:
              T.nilable(
                ArkEmail::Models::DomainRetrieveResponse::Data::DNSRecords::OrHash
              ),
            name: String,
            uuid: String,
            verified: T::Boolean,
            tenant_id: String,
            tenant_name: String,
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
          #
          # **Important:** The `name` field contains the relative hostname that you should
          # enter in your DNS provider. Most DNS providers auto-append the zone name, so you
          # only need to enter the relative part.
          #
          # For subdomains like `mail.example.com`, the zone is `example.com`, so:
          #
          # - SPF `name` would be `mail` (not `@`)
          # - DKIM `name` would be `ark-xyz._domainkey.mail`
          # - Return Path `name` would be `psrp.mail`
          dns_records:,
          # The domain name used for sending emails
          name:,
          # UUID of the domain
          uuid:,
          # Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
          # Domain must be verified before sending emails.
          verified:,
          # ID of the tenant this domain belongs to
          tenant_id: nil,
          # Name of the tenant this domain belongs to
          tenant_name: nil,
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
                  ArkEmail::Models::DomainRetrieveResponse::Data::DNSRecords
                ),
              name: String,
              uuid: String,
              verified: T::Boolean,
              tenant_id: String,
              tenant_name: String,
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
                ArkEmail::Models::DomainRetrieveResponse::Data::DNSRecords,
                ArkEmail::Internal::AnyHash
              )
            end

          # A DNS record that needs to be configured in your domain's DNS settings.
          #
          # The `name` field contains the relative hostname to enter in your DNS provider
          # (which auto-appends the zone). The `fullName` field contains the complete
          # fully-qualified domain name (FQDN) for reference.
          #
          # **Example for subdomain `mail.example.com`:**
          #
          # - `name`: `"mail"` (what you enter in DNS provider)
          # - `fullName`: `"mail.example.com"` (the complete hostname)
          #
          # **Example for root domain `example.com`:**
          #
          # - `name`: `"@"` (DNS shorthand for apex/root)
          # - `fullName`: `"example.com"`
          sig { returns(T.nilable(ArkEmail::DNSRecord)) }
          attr_reader :dkim

          sig { params(dkim: T.nilable(ArkEmail::DNSRecord::OrHash)).void }
          attr_writer :dkim

          # A DNS record that needs to be configured in your domain's DNS settings.
          #
          # The `name` field contains the relative hostname to enter in your DNS provider
          # (which auto-appends the zone). The `fullName` field contains the complete
          # fully-qualified domain name (FQDN) for reference.
          #
          # **Example for subdomain `mail.example.com`:**
          #
          # - `name`: `"mail"` (what you enter in DNS provider)
          # - `fullName`: `"mail.example.com"` (the complete hostname)
          #
          # **Example for root domain `example.com`:**
          #
          # - `name`: `"@"` (DNS shorthand for apex/root)
          # - `fullName`: `"example.com"`
          sig { returns(T.nilable(ArkEmail::DNSRecord)) }
          attr_reader :return_path

          sig do
            params(return_path: T.nilable(ArkEmail::DNSRecord::OrHash)).void
          end
          attr_writer :return_path

          # A DNS record that needs to be configured in your domain's DNS settings.
          #
          # The `name` field contains the relative hostname to enter in your DNS provider
          # (which auto-appends the zone). The `fullName` field contains the complete
          # fully-qualified domain name (FQDN) for reference.
          #
          # **Example for subdomain `mail.example.com`:**
          #
          # - `name`: `"mail"` (what you enter in DNS provider)
          # - `fullName`: `"mail.example.com"` (the complete hostname)
          #
          # **Example for root domain `example.com`:**
          #
          # - `name`: `"@"` (DNS shorthand for apex/root)
          # - `fullName`: `"example.com"`
          sig { returns(T.nilable(ArkEmail::DNSRecord)) }
          attr_reader :spf

          sig { params(spf: T.nilable(ArkEmail::DNSRecord::OrHash)).void }
          attr_writer :spf

          # The DNS zone (registrable domain) where records should be added. This is the
          # root domain that your DNS provider manages. For `mail.example.com`, the zone is
          # `example.com`. For `example.co.uk`, the zone is `example.co.uk`.
          sig { returns(T.nilable(String)) }
          attr_reader :zone

          sig { params(zone: String).void }
          attr_writer :zone

          # DNS records that must be added to your domain's DNS settings. Null if records
          # are not yet generated.
          #
          # **Important:** The `name` field contains the relative hostname that you should
          # enter in your DNS provider. Most DNS providers auto-append the zone name, so you
          # only need to enter the relative part.
          #
          # For subdomains like `mail.example.com`, the zone is `example.com`, so:
          #
          # - SPF `name` would be `mail` (not `@`)
          # - DKIM `name` would be `ark-xyz._domainkey.mail`
          # - Return Path `name` would be `psrp.mail`
          sig do
            params(
              dkim: T.nilable(ArkEmail::DNSRecord::OrHash),
              return_path: T.nilable(ArkEmail::DNSRecord::OrHash),
              spf: T.nilable(ArkEmail::DNSRecord::OrHash),
              zone: String
            ).returns(T.attached_class)
          end
          def self.new(
            # A DNS record that needs to be configured in your domain's DNS settings.
            #
            # The `name` field contains the relative hostname to enter in your DNS provider
            # (which auto-appends the zone). The `fullName` field contains the complete
            # fully-qualified domain name (FQDN) for reference.
            #
            # **Example for subdomain `mail.example.com`:**
            #
            # - `name`: `"mail"` (what you enter in DNS provider)
            # - `fullName`: `"mail.example.com"` (the complete hostname)
            #
            # **Example for root domain `example.com`:**
            #
            # - `name`: `"@"` (DNS shorthand for apex/root)
            # - `fullName`: `"example.com"`
            dkim: nil,
            # A DNS record that needs to be configured in your domain's DNS settings.
            #
            # The `name` field contains the relative hostname to enter in your DNS provider
            # (which auto-appends the zone). The `fullName` field contains the complete
            # fully-qualified domain name (FQDN) for reference.
            #
            # **Example for subdomain `mail.example.com`:**
            #
            # - `name`: `"mail"` (what you enter in DNS provider)
            # - `fullName`: `"mail.example.com"` (the complete hostname)
            #
            # **Example for root domain `example.com`:**
            #
            # - `name`: `"@"` (DNS shorthand for apex/root)
            # - `fullName`: `"example.com"`
            return_path: nil,
            # A DNS record that needs to be configured in your domain's DNS settings.
            #
            # The `name` field contains the relative hostname to enter in your DNS provider
            # (which auto-appends the zone). The `fullName` field contains the complete
            # fully-qualified domain name (FQDN) for reference.
            #
            # **Example for subdomain `mail.example.com`:**
            #
            # - `name`: `"mail"` (what you enter in DNS provider)
            # - `fullName`: `"mail.example.com"` (the complete hostname)
            #
            # **Example for root domain `example.com`:**
            #
            # - `name`: `"@"` (DNS shorthand for apex/root)
            # - `fullName`: `"example.com"`
            spf: nil,
            # The DNS zone (registrable domain) where records should be added. This is the
            # root domain that your DNS provider manages. For `mail.example.com`, the zone is
            # `example.com`. For `example.co.uk`, the zone is `example.co.uk`.
            zone: nil
          )
          end

          sig do
            override.returns(
              {
                dkim: T.nilable(ArkEmail::DNSRecord),
                return_path: T.nilable(ArkEmail::DNSRecord),
                spf: T.nilable(ArkEmail::DNSRecord),
                zone: String
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
