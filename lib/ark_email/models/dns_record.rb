# frozen_string_literal: true

module ArkEmail
  module Models
    class DNSRecord < ArkEmail::Internal::Type::BaseModel
      # @!attribute name
      #   DNS record name (hostname)
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   DNS record type
      #
      #   @return [Symbol, ArkEmail::Models::DNSRecord::Type]
      required :type, enum: -> { ArkEmail::DNSRecord::Type }

      # @!attribute value
      #   DNS record value
      #
      #   @return [String]
      required :value, String

      # @!attribute status
      #   DNS verification status:
      #
      #   - `OK` - Record is correctly configured
      #   - `Missing` - Record not found in DNS
      #   - `Invalid` - Record exists but has wrong value
      #   - `null` - Not yet checked
      #
      #   @return [Symbol, ArkEmail::Models::DNSRecord::Status, nil]
      optional :status, enum: -> { ArkEmail::DNSRecord::Status }, nil?: true

      # @!method initialize(name:, type:, value:, status: nil)
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::DNSRecord} for more details.
      #
      #   @param name [String] DNS record name (hostname)
      #
      #   @param type [Symbol, ArkEmail::Models::DNSRecord::Type] DNS record type
      #
      #   @param value [String] DNS record value
      #
      #   @param status [Symbol, ArkEmail::Models::DNSRecord::Status, nil] DNS verification status:

      # DNS record type
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

      # DNS verification status:
      #
      # - `OK` - Record is correctly configured
      # - `Missing` - Record not found in DNS
      # - `Invalid` - Record exists but has wrong value
      # - `null` - Not yet checked
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
