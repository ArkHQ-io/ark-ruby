# typed: strong

module Ark
  module Models
    class EmailRetrieveResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailRetrieveResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::EmailRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::EmailRetrieveResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::EmailRetrieveResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::EmailRetrieveResponse::Data,
            meta: Ark::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Ark::Models::EmailRetrieveResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Internal message ID
        sig { returns(String) }
        attr_accessor :id

        # Unique message token used to retrieve this email via API. Combined with id to
        # form the full message identifier: msg*{id}*{token} Use this token with GET
        # /emails/{emailId} where emailId = "msg*{id}*{token}"
        sig { returns(String) }
        attr_accessor :token

        # Sender address
        sig { returns(String) }
        attr_accessor :from

        # Message direction
        sig do
          returns(Ark::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol)
        end
        attr_accessor :scope

        # Current delivery status:
        #
        # - `pending` - Email accepted, waiting to be processed
        # - `sent` - Email transmitted to recipient's mail server
        # - `softfail` - Temporary delivery failure, will retry
        # - `hardfail` - Permanent delivery failure
        # - `bounced` - Email bounced back
        # - `held` - Held for manual review
        sig do
          returns(
            Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Email subject line
        sig { returns(String) }
        attr_accessor :subject

        # Unix timestamp when the email was sent
        sig { returns(Float) }
        attr_accessor :timestamp

        # ISO 8601 formatted timestamp
        sig { returns(Time) }
        attr_accessor :timestamp_iso

        # Recipient address
        sig { returns(String) }
        attr_accessor :to

        # Delivery attempt history (included if expand=deliveries)
        sig { returns(T.nilable(T::Array[Ark::Delivery])) }
        attr_reader :deliveries

        sig { params(deliveries: T::Array[Ark::Delivery::OrHash]).void }
        attr_writer :deliveries

        # Email headers (included if expand=headers)
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        # HTML body content (included if expand=content)
        sig { returns(T.nilable(String)) }
        attr_reader :html_body

        sig { params(html_body: String).void }
        attr_writer :html_body

        # SMTP Message-ID header
        sig { returns(T.nilable(String)) }
        attr_reader :message_id

        sig { params(message_id: String).void }
        attr_writer :message_id

        # Plain text body (included if expand=content)
        sig { returns(T.nilable(String)) }
        attr_reader :plain_body

        sig { params(plain_body: String).void }
        attr_writer :plain_body

        # Whether the message was flagged as spam
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :spam

        sig { params(spam: T::Boolean).void }
        attr_writer :spam

        # Spam score (if applicable)
        sig { returns(T.nilable(Float)) }
        attr_reader :spam_score

        sig { params(spam_score: Float).void }
        attr_writer :spam_score

        # Optional categorization tag
        sig { returns(T.nilable(String)) }
        attr_reader :tag

        sig { params(tag: String).void }
        attr_writer :tag

        sig do
          params(
            id: String,
            token: String,
            from: String,
            scope: Ark::Models::EmailRetrieveResponse::Data::Scope::OrSymbol,
            status: Ark::Models::EmailRetrieveResponse::Data::Status::OrSymbol,
            subject: String,
            timestamp: Float,
            timestamp_iso: Time,
            to: String,
            deliveries: T::Array[Ark::Delivery::OrHash],
            headers: T::Hash[Symbol, String],
            html_body: String,
            message_id: String,
            plain_body: String,
            spam: T::Boolean,
            spam_score: Float,
            tag: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Internal message ID
          id:,
          # Unique message token used to retrieve this email via API. Combined with id to
          # form the full message identifier: msg*{id}*{token} Use this token with GET
          # /emails/{emailId} where emailId = "msg*{id}*{token}"
          token:,
          # Sender address
          from:,
          # Message direction
          scope:,
          # Current delivery status:
          #
          # - `pending` - Email accepted, waiting to be processed
          # - `sent` - Email transmitted to recipient's mail server
          # - `softfail` - Temporary delivery failure, will retry
          # - `hardfail` - Permanent delivery failure
          # - `bounced` - Email bounced back
          # - `held` - Held for manual review
          status:,
          # Email subject line
          subject:,
          # Unix timestamp when the email was sent
          timestamp:,
          # ISO 8601 formatted timestamp
          timestamp_iso:,
          # Recipient address
          to:,
          # Delivery attempt history (included if expand=deliveries)
          deliveries: nil,
          # Email headers (included if expand=headers)
          headers: nil,
          # HTML body content (included if expand=content)
          html_body: nil,
          # SMTP Message-ID header
          message_id: nil,
          # Plain text body (included if expand=content)
          plain_body: nil,
          # Whether the message was flagged as spam
          spam: nil,
          # Spam score (if applicable)
          spam_score: nil,
          # Optional categorization tag
          tag: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              token: String,
              from: String,
              scope:
                Ark::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol,
              status:
                Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol,
              subject: String,
              timestamp: Float,
              timestamp_iso: Time,
              to: String,
              deliveries: T::Array[Ark::Delivery],
              headers: T::Hash[Symbol, String],
              html_body: String,
              message_id: String,
              plain_body: String,
              spam: T::Boolean,
              spam_score: Float,
              tag: String
            }
          )
        end
        def to_hash
        end

        # Message direction
        module Scope
          extend Ark::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Ark::Models::EmailRetrieveResponse::Data::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OUTGOING =
            T.let(
              :outgoing,
              Ark::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
            )
          INCOMING =
            T.let(
              :incoming,
              Ark::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Ark::Models::EmailRetrieveResponse::Data::Scope::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
            T.type_alias do
              T.all(Symbol, Ark::Models::EmailRetrieveResponse::Data::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          SENT =
            T.let(
              :sent,
              Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          SOFTFAIL =
            T.let(
              :softfail,
              Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          HARDFAIL =
            T.let(
              :hardfail,
              Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          BOUNCED =
            T.let(
              :bounced,
              Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )
          HELD =
            T.let(
              :held,
              Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Ark::Models::EmailRetrieveResponse::Data::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
