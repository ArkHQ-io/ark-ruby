# typed: strong

module ArkEmail
  module Models
    class EmailListResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::EmailListResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      # Unique message identifier (token)
      sig { returns(String) }
      attr_accessor :id

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
      sig { returns(ArkEmail::Models::EmailListResponse::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :subject

      # The tenant ID this email belongs to
      sig { returns(String) }
      attr_accessor :tenant_id

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
          from: String,
          status: ArkEmail::Models::EmailListResponse::Status::OrSymbol,
          subject: String,
          tenant_id: String,
          timestamp: Float,
          timestamp_iso: Time,
          to: String,
          tag: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique message identifier (token)
        id:,
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
        # The tenant ID this email belongs to
        tenant_id:,
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
            from: String,
            status: ArkEmail::Models::EmailListResponse::Status::TaggedSymbol,
            subject: String,
            tenant_id: String,
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
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ArkEmail::Models::EmailListResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(
            :pending,
            ArkEmail::Models::EmailListResponse::Status::TaggedSymbol
          )
        SENT =
          T.let(
            :sent,
            ArkEmail::Models::EmailListResponse::Status::TaggedSymbol
          )
        SOFTFAIL =
          T.let(
            :softfail,
            ArkEmail::Models::EmailListResponse::Status::TaggedSymbol
          )
        HARDFAIL =
          T.let(
            :hardfail,
            ArkEmail::Models::EmailListResponse::Status::TaggedSymbol
          )
        BOUNCED =
          T.let(
            :bounced,
            ArkEmail::Models::EmailListResponse::Status::TaggedSymbol
          )
        HELD =
          T.let(
            :held,
            ArkEmail::Models::EmailListResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ArkEmail::Models::EmailListResponse::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
