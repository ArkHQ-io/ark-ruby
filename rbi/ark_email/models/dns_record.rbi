# typed: strong

module ArkEmail
  module Models
    class DNSRecord < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(ArkEmail::DNSRecord, ArkEmail::Internal::AnyHash) }

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
      sig { returns(ArkEmail::DNSRecord::Type::TaggedSymbol) }
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
      sig { returns(T.nilable(ArkEmail::DNSRecord::Status::TaggedSymbol)) }
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
          type: ArkEmail::DNSRecord::Type::OrSymbol,
          value: String,
          status: T.nilable(ArkEmail::DNSRecord::Status::OrSymbol)
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
            type: ArkEmail::DNSRecord::Type::TaggedSymbol,
            value: String,
            status: T.nilable(ArkEmail::DNSRecord::Status::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # The DNS record type to create
      module Type
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, ArkEmail::DNSRecord::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TXT = T.let(:TXT, ArkEmail::DNSRecord::Type::TaggedSymbol)
        CNAME = T.let(:CNAME, ArkEmail::DNSRecord::Type::TaggedSymbol)
        MX = T.let(:MX, ArkEmail::DNSRecord::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[ArkEmail::DNSRecord::Type::TaggedSymbol])
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
          T.type_alias { T.all(Symbol, ArkEmail::DNSRecord::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK = T.let(:OK, ArkEmail::DNSRecord::Status::TaggedSymbol)
        MISSING = T.let(:Missing, ArkEmail::DNSRecord::Status::TaggedSymbol)
        INVALID = T.let(:Invalid, ArkEmail::DNSRecord::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[ArkEmail::DNSRecord::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
