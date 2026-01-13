# typed: strong

module ArkEmail
  module Models
    class DNSRecord < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(ArkEmail::DNSRecord, ArkEmail::Internal::AnyHash) }

      # DNS record name (hostname)
      sig { returns(String) }
      attr_accessor :name

      # DNS record type
      sig { returns(ArkEmail::DNSRecord::Type::TaggedSymbol) }
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
      sig { returns(T.nilable(ArkEmail::DNSRecord::Status::TaggedSymbol)) }
      attr_accessor :status

      sig do
        params(
          name: String,
          type: ArkEmail::DNSRecord::Type::OrSymbol,
          value: String,
          status: T.nilable(ArkEmail::DNSRecord::Status::OrSymbol)
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
            type: ArkEmail::DNSRecord::Type::TaggedSymbol,
            value: String,
            status: T.nilable(ArkEmail::DNSRecord::Status::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # DNS record type
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

      # DNS verification status:
      #
      # - `OK` - Record is correctly configured
      # - `Missing` - Record not found in DNS
      # - `Invalid` - Record exists but has wrong value
      # - `null` - Not yet checked
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
