# frozen_string_literal: true

module ArkEmail
  module Models
    class DNSRecord < ArkEmail::Internal::Type::BaseModel
      # @!attribute name
      #   The hostname where the record should be created (relative to your domain)
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

      # @!method initialize(name:, type:, value:, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::DNSRecord} for more details.
      #
      #   A DNS record that needs to be configured in your domain's DNS settings
      #
      #   @param name [String] The hostname where the record should be created (relative to your domain)
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
