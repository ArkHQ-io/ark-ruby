# typed: strong

module ArkEmail
  module Models
    class EmailListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailListParams, ArkEmail::Internal::AnyHash)
        end

      # Return emails sent after this timestamp (Unix seconds or ISO 8601)
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # Return emails sent before this timestamp
      sig { returns(T.nilable(String)) }
      attr_reader :before

      sig { params(before: String).void }
      attr_writer :before

      # Filter by sender email address
      sig { returns(T.nilable(String)) }
      attr_reader :from

      sig { params(from: String).void }
      attr_writer :from

      # Page number (starts at 1)
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Results per page (max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :per_page

      sig { params(per_page: Integer).void }
      attr_writer :per_page

      # Filter by delivery status:
      #
      # - `pending` - Email accepted, waiting to be processed
      # - `sent` - Email transmitted to recipient's mail server
      # - `softfail` - Temporary delivery failure, will retry
      # - `hardfail` - Permanent delivery failure
      # - `bounced` - Email bounced back
      # - `held` - Held for manual review
      sig { returns(T.nilable(ArkEmail::EmailListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ArkEmail::EmailListParams::Status::OrSymbol).void }
      attr_writer :status

      # Filter by tag
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      # Filter by recipient email address
      sig { returns(T.nilable(String)) }
      attr_reader :to

      sig { params(to: String).void }
      attr_writer :to

      sig do
        params(
          after: String,
          before: String,
          from: String,
          page: Integer,
          per_page: Integer,
          status: ArkEmail::EmailListParams::Status::OrSymbol,
          tag: String,
          to: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Return emails sent after this timestamp (Unix seconds or ISO 8601)
        after: nil,
        # Return emails sent before this timestamp
        before: nil,
        # Filter by sender email address
        from: nil,
        # Page number (starts at 1)
        page: nil,
        # Results per page (max 100)
        per_page: nil,
        # Filter by delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        status: nil,
        # Filter by tag
        tag: nil,
        # Filter by recipient email address
        to: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after: String,
            before: String,
            from: String,
            page: Integer,
            per_page: Integer,
            status: ArkEmail::EmailListParams::Status::OrSymbol,
            tag: String,
            to: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by delivery status:
      #
      # - `pending` - Email accepted, waiting to be processed
      # - `sent` - Email transmitted to recipient's mail server
      # - `softfail` - Temporary delivery failure, will retry
      # - `hardfail` - Permanent delivery failure
      # - `bounced` - Email bounced back
      # - `held` - Held for manual review
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::EmailListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, ArkEmail::EmailListParams::Status::TaggedSymbol)
        SENT = T.let(:sent, ArkEmail::EmailListParams::Status::TaggedSymbol)
        SOFTFAIL =
          T.let(:softfail, ArkEmail::EmailListParams::Status::TaggedSymbol)
        HARDFAIL =
          T.let(:hardfail, ArkEmail::EmailListParams::Status::TaggedSymbol)
        BOUNCED =
          T.let(:bounced, ArkEmail::EmailListParams::Status::TaggedSymbol)
        HELD = T.let(:held, ArkEmail::EmailListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::EmailListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
