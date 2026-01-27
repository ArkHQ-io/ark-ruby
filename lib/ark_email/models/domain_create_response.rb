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

        # @!attribute verified_at
        #   Timestamp when the domain ownership was verified, or null if not yet verified
        #
        #   @return [Time, nil]
        optional :verified_at, Time, api_name: :verifiedAt, nil?: true

        # @!method initialize(id:, created_at:, dns_records:, name:, uuid:, verified:, verified_at: nil)
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
        #   @param verified_at [Time, nil] Timestamp when the domain ownership was verified, or null if not yet verified

        # @see ArkEmail::Models::DomainCreateResponse::Data#dns_records
        class DNSRecords < ArkEmail::Internal::Type::BaseModel
          # @!attribute dkim
          #   A DNS record that needs to be configured in your domain's DNS settings
          #
          #   @return [ArkEmail::Models::DNSRecord, nil]
          optional :dkim, -> { ArkEmail::DNSRecord }, nil?: true

          # @!attribute return_path
          #   A DNS record that needs to be configured in your domain's DNS settings
          #
          #   @return [ArkEmail::Models::DNSRecord, nil]
          optional :return_path, -> { ArkEmail::DNSRecord }, api_name: :returnPath, nil?: true

          # @!attribute spf
          #   A DNS record that needs to be configured in your domain's DNS settings
          #
          #   @return [ArkEmail::Models::DNSRecord, nil]
          optional :spf, -> { ArkEmail::DNSRecord }, nil?: true

          # @!method initialize(dkim: nil, return_path: nil, spf: nil)
          #   DNS records that must be added to your domain's DNS settings. Null if records
          #   are not yet generated.
          #
          #   @param dkim [ArkEmail::Models::DNSRecord, nil] A DNS record that needs to be configured in your domain's DNS settings
          #
          #   @param return_path [ArkEmail::Models::DNSRecord, nil] A DNS record that needs to be configured in your domain's DNS settings
          #
          #   @param spf [ArkEmail::Models::DNSRecord, nil] A DNS record that needs to be configured in your domain's DNS settings
        end
      end
    end
  end
end
