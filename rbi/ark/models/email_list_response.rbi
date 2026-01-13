# typed: strong

module Ark
  module Models
    class EmailListResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::EmailListResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::EmailListResponse::Data) }
      attr_reader :data

      sig { params(data: Ark::Models::EmailListResponse::Data::OrHash).void }
      attr_writer :data

      sig { returns(Ark::APIMeta) }
      attr_reader :meta

      sig { params(meta: Ark::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Ark::Models::EmailListResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::EmailListResponse::Data,
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
            T.any(Ark::Models::EmailListResponse::Data, Ark::Internal::AnyHash)
          end

        sig { returns(T::Array[Ark::Models::EmailListResponse::Data::Message]) }
        attr_accessor :messages

        sig { returns(Ark::Pagination) }
        attr_reader :pagination

        sig { params(pagination: Ark::Pagination::OrHash).void }
        attr_writer :pagination

        sig do
          params(
            messages:
              T::Array[Ark::Models::EmailListResponse::Data::Message::OrHash],
            pagination: Ark::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(messages:, pagination:)
        end

        sig do
          override.returns(
            {
              messages: T::Array[Ark::Models::EmailListResponse::Data::Message],
              pagination: Ark::Pagination
            }
          )
        end
        def to_hash
        end

        class Message < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::EmailListResponse::Data::Message,
                Ark::Internal::AnyHash
              )
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
          sig do
            returns(
              Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
            )
          end
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
              status:
                Ark::Models::EmailListResponse::Data::Message::Status::OrSymbol,
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
                status:
                  Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol,
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
              T.type_alias do
                T.all(
                  Symbol,
                  Ark::Models::EmailListResponse::Data::Message::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING =
              T.let(
                :pending,
                Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
              )
            SENT =
              T.let(
                :sent,
                Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
              )
            SOFTFAIL =
              T.let(
                :softfail,
                Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
              )
            HARDFAIL =
              T.let(
                :hardfail,
                Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
              )
            BOUNCED =
              T.let(
                :bounced,
                Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
              )
            HELD =
              T.let(
                :held,
                Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Ark::Models::EmailListResponse::Data::Message::Status::TaggedSymbol
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
end
