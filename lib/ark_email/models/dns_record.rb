# frozen_string_literal: true

module ArkEmail
  module Models
    class DNSRecord < ArkEmail::Internal::Type::BaseModel
      # @!attribute full_name
      #   The complete fully-qualified domain name (FQDN). Use this as a reference to
      #   verify the record is configured correctly.
      #
      #   @return [String]
      required :full_name, String, api_name: :fullName

      # @!attribute name
      #   The relative hostname to enter in your DNS provider. Most DNS providers
      #   auto-append the zone name, so you only need to enter this relative part.
      #
      #   - `"@"` means the apex/root of the zone (for root domains)
      #   - `"mail"` for a subdomain like `mail.example.com`
      #   - `"ark-xyz._domainkey.mail"` for DKIM on a subdomain
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   The DNS record type to create
      #
      #   @return [Symbol, ArkEmail::Models::DNSRecord::Type]
      required :type, enum: -> { ArkEmail::DNSRecord::Type }

      # @!attribute value
      #   The value to set for the DNS record
      #
      #   @return [String]
      required :value, String

      # @!attribute status
      #   Current verification status of this DNS record:
      #
      #   - `OK` - Record is correctly configured and verified
      #   - `Missing` - Record was not found in your DNS
      #   - `Invalid` - Record exists but has an incorrect value
      #   - `null` - Record has not been checked yet
      #
      #   @return [Symbol, ArkEmail::Models::DNSRecord::Status, nil]
      optional :status, enum: -> { ArkEmail::DNSRecord::Status }, nil?: true

      # @!method initialize(full_name:, name:, type:, value:, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::DNSRecord} for more details.
      #
      #   A DNS record that needs to be configured in your domain's DNS settings.
      #
      #   The `name` field contains the relative hostname to enter in your DNS provider
      #   (which auto-appends the zone). The `fullName` field contains the complete
      #   fully-qualified domain name (FQDN) for reference.
      #
      #   **Example for subdomain `mail.example.com`:**
      #
      #   - `name`: `"mail"` (what you enter in DNS provider)
      #   - `fullName`: `"mail.example.com"` (the complete hostname)
      #
      #   **Example for root domain `example.com`:**
      #
      #   - `name`: `"@"` (DNS shorthand for apex/root)
      #   - `fullName`: `"example.com"`
      #
      #   @param full_name [String] The complete fully-qualified domain name (FQDN).
      #
      #   @param name [String] The relative hostname to enter in your DNS provider.
      #
      #   @param type [Symbol, ArkEmail::Models::DNSRecord::Type] The DNS record type to create
      #
      #   @param value [String] The value to set for the DNS record
      #
      #   @param status [Symbol, ArkEmail::Models::DNSRecord::Status, nil] Current verification status of this DNS record:

      # The DNS record type to create
      #
      # @see ArkEmail::Models::DNSRecord#type
      module Type
        extend ArkEmail::Internal::Type::Enum

        TXT = :TXT
        CNAME = :CNAME
        MX = :MX

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Current verification status of this DNS record:
      #
      # - `OK` - Record is correctly configured and verified
      # - `Missing` - Record was not found in your DNS
      # - `Invalid` - Record exists but has an incorrect value
      # - `null` - Record has not been checked yet
      #
      # @see ArkEmail::Models::DNSRecord#status
      module Status
        extend ArkEmail::Internal::Type::Enum

        OK = :OK
        MISSING = :Missing
        INVALID = :Invalid

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
