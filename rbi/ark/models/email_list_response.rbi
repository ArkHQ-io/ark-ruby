# typed: strong

module Ark
  module Models
    class EmailListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailListResponse, Ark::Internal::AnyHash)
        end

      # Internal message ID
      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :token

      sig { returns(String) }
      attr_accessor :from

      # Current delivery status:
      #
      # - `pending` - Email accepted, waiting to be processed
      # - `sent` - Email transmitted to recipient's mail server
      # - `softfail` - Temporary delivery failure, will retry
      # - `hardfail` - Permanent delivery failure
      # - `bounced` - Email bounced back
      # - `held` - Held for manual review
      sig { returns(Ark::Models::EmailListResponse::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :subject

      sig { returns(Float) }
      attr_accessor :timestamp

      sig { returns(Time) }
      attr_accessor :timestamp_iso

      sig { returns(String) }
      attr_accessor :to

      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig do
        params(
          id: String,
          token: String,
          from: String,
          status: Ark::Models::EmailListResponse::Status::OrSymbol,
          subject: String,
          timestamp: Float,
          timestamp_iso: Time,
          to: String,
          tag: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Internal message ID
        id:,
        token:,
        from:,
        # Current delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        status:,
        subject:,
        timestamp:,
        timestamp_iso:,
        to:,
        tag: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            token: String,
            from: String,
            status: Ark::Models::EmailListResponse::Status::TaggedSymbol,
            subject: String,
            timestamp: Float,
            timestamp_iso: Time,
            to: String,
            tag: String
          }
        )
      end
      def to_hash
      end

      # Current delivery status:
      #
      # - `pending` - Email accepted, waiting to be processed
      # - `sent` - Email transmitted to recipient's mail server
      # - `softfail` - Temporary delivery failure, will retry
      # - `hardfail` - Permanent delivery failure
      # - `bounced` - Email bounced back
      # - `held` - Held for manual review
      module Status
        extend Ark::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Ark::Models::EmailListResponse::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, Ark::Models::EmailListResponse::Status::TaggedSymbol)
        SENT =
          T.let(:sent, Ark::Models::EmailListResponse::Status::TaggedSymbol)
        SOFTFAIL =
          T.let(:softfail, Ark::Models::EmailListResponse::Status::TaggedSymbol)
        HARDFAIL =
          T.let(:hardfail, Ark::Models::EmailListResponse::Status::TaggedSymbol)
        BOUNCED =
          T.let(:bounced, Ark::Models::EmailListResponse::Status::TaggedSymbol)
        HELD =
          T.let(:held, Ark::Models::EmailListResponse::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Ark::Models::EmailListResponse::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
