# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Domains#create
    class DomainCreateResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::DomainCreateResponse::Data]
      required :data, -> { ArkEmail::Models::DomainCreateResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::DomainCreateResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::DomainCreateResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Unique domain identifier
        #
        #   @return [Integer]
        required :id, Integer

        # @!attribute created_at
        #   Timestamp when the domain was added
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute dns_records
        #   DNS records that must be added to your domain's DNS settings. Null if records
        #   are not yet generated.
        #
        #   **Important:** The `name` field contains the relative hostname that you should
        #   enter in your DNS provider. Most DNS providers auto-append the zone name, so you
        #   only need to enter the relative part.
        #
        #   For subdomains like `mail.example.com`, the zone is `example.com`, so:
        #
        #   - SPF `name` would be `mail` (not `@`)
        #   - DKIM `name` would be `ark-xyz._domainkey.mail`
        #   - Return Path `name` would be `psrp.mail`
        #
        #   @return [ArkEmail::Models::DomainCreateResponse::Data::DNSRecords, nil]
        required :dns_records,
                 -> { ArkEmail::Models::DomainCreateResponse::Data::DNSRecords },
                 api_name: :dnsRecords,
                 nil?: true

        # @!attribute name
        #   The domain name used for sending emails
        #
        #   @return [String]
        required :name, String

        # @!attribute uuid
        #   UUID of the domain
        #
        #   @return [String]
        required :uuid, String

        # @!attribute verified
        #   Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
        #   Domain must be verified before sending emails.
        #
        #   @return [Boolean]
        required :verified, ArkEmail::Internal::Type::Boolean

        # @!attribute tenant_id
        #   ID of the tenant this domain belongs to
        #
        #   @return [String, nil]
        optional :tenant_id, String

        # @!attribute tenant_name
        #   Name of the tenant this domain belongs to
        #
        #   @return [String, nil]
        optional :tenant_name, String

        # @!attribute verified_at
        #   Timestamp when the domain ownership was verified, or null if not yet verified
        #
        #   @return [Time, nil]
        optional :verified_at, Time, api_name: :verifiedAt, nil?: true

        # @!method initialize(id:, created_at:, dns_records:, name:, uuid:, verified:, tenant_id: nil, tenant_name: nil, verified_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {ArkEmail::Models::DomainCreateResponse::Data} for more details.
        #
        #   @param id [Integer] Unique domain identifier
        #
        #   @param created_at [Time] Timestamp when the domain was added
        #
        #   @param dns_records [ArkEmail::Models::DomainCreateResponse::Data::DNSRecords, nil] DNS records that must be added to your domain's DNS settings. Null if records ar
        #
        #   @param name [String] The domain name used for sending emails
        #
        #   @param uuid [String] UUID of the domain
        #
        #   @param verified [Boolean] Whether all DNS records (SPF, DKIM, Return Path) are correctly configured. Domai
        #
        #   @param tenant_id [String] ID of the tenant this domain belongs to
        #
        #   @param tenant_name [String] Name of the tenant this domain belongs to
        #
        #   @param verified_at [Time, nil] Timestamp when the domain ownership was verified, or null if not yet verified

        # @see ArkEmail::Models::DomainCreateResponse::Data#dns_records
        class DNSRecords < ArkEmail::Internal::Type::BaseModel
          # @!attribute dkim
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
          #   @return [ArkEmail::Models::DNSRecord, nil]
          optional :dkim, -> { ArkEmail::DNSRecord }, nil?: true

          # @!attribute return_path
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
          #   @return [ArkEmail::Models::DNSRecord, nil]
          optional :return_path, -> { ArkEmail::DNSRecord }, api_name: :returnPath, nil?: true

          # @!attribute spf
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
          #   @return [ArkEmail::Models::DNSRecord, nil]
          optional :spf, -> { ArkEmail::DNSRecord }, nil?: true

          # @!attribute zone
          #   The DNS zone (registrable domain) where records should be added. This is the
          #   root domain that your DNS provider manages. For `mail.example.com`, the zone is
          #   `example.com`. For `example.co.uk`, the zone is `example.co.uk`.
          #
          #   @return [String, nil]
          optional :zone, String

          # @!method initialize(dkim: nil, return_path: nil, spf: nil, zone: nil)
          #   Some parameter documentations has been truncated, see
          #   {ArkEmail::Models::DomainCreateResponse::Data::DNSRecords} for more details.
          #
          #   DNS records that must be added to your domain's DNS settings. Null if records
          #   are not yet generated.
          #
          #   **Important:** The `name` field contains the relative hostname that you should
          #   enter in your DNS provider. Most DNS providers auto-append the zone name, so you
          #   only need to enter the relative part.
          #
          #   For subdomains like `mail.example.com`, the zone is `example.com`, so:
          #
          #   - SPF `name` would be `mail` (not `@`)
          #   - DKIM `name` would be `ark-xyz._domainkey.mail`
          #   - Return Path `name` would be `psrp.mail`
          #
          #   @param dkim [ArkEmail::Models::DNSRecord, nil] A DNS record that needs to be configured in your domain's DNS settings.
          #
          #   @param return_path [ArkEmail::Models::DNSRecord, nil] A DNS record that needs to be configured in your domain's DNS settings.
          #
          #   @param spf [ArkEmail::Models::DNSRecord, nil] A DNS record that needs to be configured in your domain's DNS settings.
          #
          #   @param zone [String] The DNS zone (registrable domain) where records should be added.
        end
      end
    end
  end
end
