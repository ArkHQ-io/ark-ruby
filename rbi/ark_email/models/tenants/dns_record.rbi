# typed: strong

module ArkEmail
  module Models
    module Tenants
      class DNSRecord < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::Tenants::DNSRecord, ArkEmail::Internal::AnyHash)
          end

        # The complete fully-qualified domain name (FQDN). Use this as a reference to
        # verify the record is configured correctly.
        sig { returns(String) }
        attr_accessor :full_name

        # The relative hostname to enter in your DNS provider. Most DNS providers
        # auto-append the zone name, so you only need to enter this relative part.
        #
        # - `"@"` means the apex/root of the zone (for root domains)
        # - `"mail"` for a subdomain like `mail.example.com`
        # - `"ark-xyz._domainkey.mail"` for DKIM on a subdomain
        sig { returns(String) }
        attr_accessor :name

        # The DNS record type to create
        sig { returns(ArkEmail::Tenants::DNSRecord::Type::TaggedSymbol) }
        attr_accessor :type

        # The value to set for the DNS record
        sig { returns(String) }
        attr_accessor :value

        # Current verification status of this DNS record:
        #
        # - `OK` - Record is correctly configured and verified
        # - `Missing` - Record was not found in your DNS
        # - `Invalid` - Record exists but has an incorrect value
        # - `null` - Record has not been checked yet
        sig do
          returns(T.nilable(ArkEmail::Tenants::DNSRecord::Status::TaggedSymbol))
        end
        attr_accessor :status

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
        sig do
          params(
            full_name: String,
            name: String,
            type: ArkEmail::Tenants::DNSRecord::Type::OrSymbol,
            value: String,
            status: T.nilable(ArkEmail::Tenants::DNSRecord::Status::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          # The complete fully-qualified domain name (FQDN). Use this as a reference to
          # verify the record is configured correctly.
          full_name:,
          # The relative hostname to enter in your DNS provider. Most DNS providers
          # auto-append the zone name, so you only need to enter this relative part.
          #
          # - `"@"` means the apex/root of the zone (for root domains)
          # - `"mail"` for a subdomain like `mail.example.com`
          # - `"ark-xyz._domainkey.mail"` for DKIM on a subdomain
          name:,
          # The DNS record type to create
          type:,
          # The value to set for the DNS record
          value:,
          # Current verification status of this DNS record:
          #
          # - `OK` - Record is correctly configured and verified
          # - `Missing` - Record was not found in your DNS
          # - `Invalid` - Record exists but has an incorrect value
          # - `null` - Record has not been checked yet
          status: nil
        )
        end

        sig do
          override.returns(
            {
              full_name: String,
              name: String,
              type: ArkEmail::Tenants::DNSRecord::Type::TaggedSymbol,
              value: String,
              status:
                T.nilable(ArkEmail::Tenants::DNSRecord::Status::TaggedSymbol)
            }
          )
        end
        def to_hash
        end

        # The DNS record type to create
        module Type
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, ArkEmail::Tenants::DNSRecord::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TXT = T.let(:TXT, ArkEmail::Tenants::DNSRecord::Type::TaggedSymbol)
          CNAME =
            T.let(:CNAME, ArkEmail::Tenants::DNSRecord::Type::TaggedSymbol)
          MX = T.let(:MX, ArkEmail::Tenants::DNSRecord::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[ArkEmail::Tenants::DNSRecord::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # Current verification status of this DNS record:
        #
        # - `OK` - Record is correctly configured and verified
        # - `Missing` - Record was not found in your DNS
        # - `Invalid` - Record exists but has an incorrect value
        # - `null` - Record has not been checked yet
        module Status
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, ArkEmail::Tenants::DNSRecord::Status) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OK = T.let(:OK, ArkEmail::Tenants::DNSRecord::Status::TaggedSymbol)
          MISSING =
            T.let(:Missing, ArkEmail::Tenants::DNSRecord::Status::TaggedSymbol)
          INVALID =
            T.let(:Invalid, ArkEmail::Tenants::DNSRecord::Status::TaggedSymbol)

          sig do
            override.returns(
              T::Array[ArkEmail::Tenants::DNSRecord::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
