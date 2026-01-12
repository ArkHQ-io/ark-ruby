# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Domains#create
    class DomainResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::DomainResponse::Data]
      required :data, -> { Ark::DomainResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, Ark::Models::DomainResponse::Success]
      required :success, enum: -> { Ark::DomainResponse::Success }

      # @!method initialize(data:, meta:, success:)
      #   @param data [Ark::Models::DomainResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, Ark::Models::DomainResponse::Success]

      # @see Ark::Models::DomainResponse#data
      class Data < Ark::Internal::Type::BaseModel
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
        #   @return [Ark::Models::DomainResponse::Data::DNSRecords]
        required :dns_records, -> { Ark::DomainResponse::Data::DNSRecords }, api_name: :dnsRecords

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
        required :verified, Ark::Internal::Type::Boolean

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
        #   @param dns_records [Ark::Models::DomainResponse::Data::DNSRecords]
        #
        #   @param name [String] Domain name
        #
        #   @param uuid [String]
        #
        #   @param verified [Boolean] Whether DNS is verified
        #
        #   @param verified_at [Time, nil] When the domain was verified (null if not verified)

        # @see Ark::Models::DomainResponse::Data#dns_records
        class DNSRecords < Ark::Internal::Type::BaseModel
          # @!attribute dkim
          #
          #   @return [Ark::Models::DNSRecord]
          required :dkim, -> { Ark::DNSRecord }

          # @!attribute return_path
          #
          #   @return [Ark::Models::DNSRecord]
          required :return_path, -> { Ark::DNSRecord }, api_name: :returnPath

          # @!attribute spf
          #
          #   @return [Ark::Models::DNSRecord]
          required :spf, -> { Ark::DNSRecord }

          # @!method initialize(dkim:, return_path:, spf:)
          #   @param dkim [Ark::Models::DNSRecord]
          #   @param return_path [Ark::Models::DNSRecord]
          #   @param spf [Ark::Models::DNSRecord]
        end
      end

      # @see Ark::Models::DomainResponse#success
      module Success
        extend Ark::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
