# typed: strong

module Ark
  module Models
    class DNSRecord < Ark::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Ark::DNSRecord, Ark::Internal::AnyHash) }

      # DNS record name (hostname)
      sig { returns(String) }
      attr_accessor :name

      # DNS record type
      sig { returns(Ark::DNSRecord::Type::TaggedSymbol) }
      attr_accessor :type

      # DNS record value
      sig { returns(String) }
      attr_accessor :value

      # DNS verification status:
      #
      # - `OK` - Record is correctly configured
      # - `Missing` - Record not found in DNS
      # - `Invalid` - Record exists but has wrong value
      # - `null` - Not yet checked
      sig { returns(T.nilable(Ark::DNSRecord::Status::TaggedSymbol)) }
      attr_accessor :status

      sig do
        params(
          name: String,
          type: Ark::DNSRecord::Type::OrSymbol,
          value: String,
          status: T.nilable(Ark::DNSRecord::Status::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # DNS record name (hostname)
        name:,
        # DNS record type
        type:,
        # DNS record value
        value:,
        # DNS verification status:
        #
        # - `OK` - Record is correctly configured
        # - `Missing` - Record not found in DNS
        # - `Invalid` - Record exists but has wrong value
        # - `null` - Not yet checked
        status: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            type: Ark::DNSRecord::Type::TaggedSymbol,
            value: String,
            status: T.nilable(Ark::DNSRecord::Status::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # DNS record type
      module Type
        extend Ark::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Ark::DNSRecord::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TXT = T.let(:TXT, Ark::DNSRecord::Type::TaggedSymbol)
        CNAME = T.let(:CNAME, Ark::DNSRecord::Type::TaggedSymbol)
        MX = T.let(:MX, Ark::DNSRecord::Type::TaggedSymbol)

        sig { override.returns(T::Array[Ark::DNSRecord::Type::TaggedSymbol]) }
        def self.values
        end
      end

      # DNS verification status:
      #
      # - `OK` - Record is correctly configured
      # - `Missing` - Record not found in DNS
      # - `Invalid` - Record exists but has wrong value
      # - `null` - Not yet checked
      module Status
        extend Ark::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Ark::DNSRecord::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK = T.let(:OK, Ark::DNSRecord::Status::TaggedSymbol)
        MISSING = T.let(:Missing, Ark::DNSRecord::Status::TaggedSymbol)
        INVALID = T.let(:Invalid, Ark::DNSRecord::Status::TaggedSymbol)

        sig { override.returns(T::Array[Ark::DNSRecord::Status::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
