# typed: strong

module Ark
  module Internal
    class PageNumberPagination
      include Ark::Internal::Type::BasePage

      Elem = type_member

      sig { returns(Data) }
      attr_accessor :data

      # @api private
      sig { returns(String) }
      def inspect
      end

      class Data < Ark::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(Data, Ark::Internal::AnyHash) }

        sig { returns(T.nilable(T::Array[Data::Message])) }
        attr_reader :messages

        sig { params(messages: T::Array[Data::Message::OrHash]).void }
        attr_writer :messages

        sig { returns(T.nilable(Data::Pagination)) }
        attr_reader :pagination

        sig { params(pagination: Data::Pagination::OrHash).void }
        attr_writer :pagination

        sig do
          params(
            messages: T::Array[Data::Message::OrHash],
            pagination: Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(messages: nil, pagination: nil)
        end

        sig do
          override.returns(
            { messages: T::Array[Data::Message], pagination: Data::Pagination }
          )
        end
        def to_hash
        end

        class Message < Ark::Internal::Type::BaseModel
          OrHash = T.type_alias { T.any(Data::Message, Ark::Internal::AnyHash) }

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
          sig { returns(Data::Message::Status::TaggedSymbol) }
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
              status: Data::Message::Status::OrSymbol,
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
                status: Data::Message::Status::TaggedSymbol,
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

            TaggedSymbol = T.type_alias { T.all(Symbol, Data::Message::Status) }
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING = T.let(:pending, Data::Message::Status::TaggedSymbol)
            SENT = T.let(:sent, Data::Message::Status::TaggedSymbol)
            SOFTFAIL = T.let(:softfail, Data::Message::Status::TaggedSymbol)
            HARDFAIL = T.let(:hardfail, Data::Message::Status::TaggedSymbol)
            BOUNCED = T.let(:bounced, Data::Message::Status::TaggedSymbol)
            HELD = T.let(:held, Data::Message::Status::TaggedSymbol)

            sig do
              override.returns(T::Array[Data::Message::Status::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class Pagination < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(Data::Pagination, Ark::Internal::AnyHash) }

          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          sig do
            params(page: Integer, total_pages: Integer).returns(
              T.attached_class
            )
          end
          def self.new(page: nil, total_pages: nil)
          end

          sig { override.returns({ page: Integer, total_pages: Integer }) }
          def to_hash
          end
        end
      end
    end
  end
end
