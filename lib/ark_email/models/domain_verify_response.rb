# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Domains#verify
    class DomainVerifyResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::DomainVerifyResponse::Data]
      required :data, -> { ArkEmail::Models::DomainVerifyResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::DomainVerifyResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::DomainVerifyResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute id
        #   Domain ID
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute dns_records
        #
        #   @return [ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords]
        required :dns_records,
                 -> { ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords },
                 api_name: :dnsRecords

        # @!attribute name
        #   Domain name
        #
        #   @return [String]
        required :name, String

        # @!attribute uuid
        #
        #   @return [String]
        required :uuid, String

        # @!attribute verified
        #   Whether DNS is verified
        #
        #   @return [Boolean]
        required :verified, ArkEmail::Internal::Type::Boolean

        # @!attribute verified_at
        #   When the domain was verified (null if not verified)
        #
        #   @return [Time, nil]
        optional :verified_at, Time, api_name: :verifiedAt, nil?: true

        # @!method initialize(id:, created_at:, dns_records:, name:, uuid:, verified:, verified_at: nil)
        #   @param id [String] Domain ID
        #
        #   @param created_at [Time]
        #
        #   @param dns_records [ArkEmail::Models::DomainVerifyResponse::Data::DNSRecords]
        #
        #   @param name [String] Domain name
        #
        #   @param uuid [String]
        #
        #   @param verified [Boolean] Whether DNS is verified
        #
        #   @param verified_at [Time, nil] When the domain was verified (null if not verified)

        # @see ArkEmail::Models::DomainVerifyResponse::Data#dns_records
        class DNSRecords < ArkEmail::Internal::Type::BaseModel
          # @!attribute dkim
          #
          #   @return [ArkEmail::Models::DNSRecord]
          required :dkim, -> { ArkEmail::DNSRecord }

          # @!attribute return_path
          #
          #   @return [ArkEmail::Models::DNSRecord]
          required :return_path, -> { ArkEmail::DNSRecord }, api_name: :returnPath

          # @!attribute spf
          #
          #   @return [ArkEmail::Models::DNSRecord]
          required :spf, -> { ArkEmail::DNSRecord }

          # @!method initialize(dkim:, return_path:, spf:)
          #   @param dkim [ArkEmail::Models::DNSRecord]
          #   @param return_path [ArkEmail::Models::DNSRecord]
          #   @param spf [ArkEmail::Models::DNSRecord]
        end
      end
    end
  end
end
