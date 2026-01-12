# frozen_string_literal: true

module Ark
  module Models
    class DNSRecord < Ark::Internal::Type::BaseModel
      # @!attribute name
      #   DNS record name (hostname)
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   DNS record type
      #
      #   @return [Symbol, Ark::Models::DNSRecord::Type]
      required :type, enum: -> { Ark::DNSRecord::Type }

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
      #   @return [Symbol, Ark::Models::DNSRecord::Status, nil]
      optional :status, enum: -> { Ark::DNSRecord::Status }, nil?: true

      # @!method initialize(name:, type:, value:, status: nil)
      #   Some parameter documentations has been truncated, see {Ark::Models::DNSRecord}
      #   for more details.
      #
      #   @param name [String] DNS record name (hostname)
      #
      #   @param type [Symbol, Ark::Models::DNSRecord::Type] DNS record type
      #
      #   @param value [String] DNS record value
      #
      #   @param status [Symbol, Ark::Models::DNSRecord::Status, nil] DNS verification status:

      # DNS record type
      #
      # @see Ark::Models::DNSRecord#type
      module Type
        extend Ark::Internal::Type::Enum

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
      # @see Ark::Models::DNSRecord#status
      module Status
        extend Ark::Internal::Type::Enum

        OK = :OK
        MISSING = :Missing
        INVALID = :Invalid

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
