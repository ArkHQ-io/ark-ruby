# typed: strong

module Ark
  module Models
    class EmailRetrieveDeliveriesResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Ark::Models::EmailRetrieveDeliveriesResponse,
            Ark::Internal::AnyHash
          )
        end

      sig { returns(Ark::Models::EmailRetrieveDeliveriesResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Ark::Models::EmailRetrieveDeliveriesResponse::Data::OrHash
        ).void
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
          data: Ark::Models::EmailRetrieveDeliveriesResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::EmailRetrieveDeliveriesResponse::Data,
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
              Ark::Models::EmailRetrieveDeliveriesResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery
            ]
          )
        end
        attr_accessor :deliveries

        # Internal message ID
        sig { returns(String) }
        attr_accessor :message_id

        # Message token
        sig { returns(String) }
        attr_accessor :message_token

        sig do
          params(
            deliveries:
              T::Array[
                Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery::OrHash
              ],
            message_id: String,
            message_token: String
          ).returns(T.attached_class)
        end
        def self.new(
          deliveries:,
          # Internal message ID
          message_id:,
          # Message token
          message_token:
        )
        end

        sig do
          override.returns(
            {
              deliveries:
                T::Array[
                  Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery
                ],
              message_id: String,
              message_token: String
            }
          )
        end
        def to_hash
        end

        class Delivery < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::EmailRetrieveDeliveriesResponse::Data::Delivery,
                Ark::Internal::AnyHash
              )
            end

          # Delivery attempt ID
          sig { returns(String) }
          attr_accessor :id

          # Delivery status (lowercase)
          sig { returns(String) }
          attr_accessor :status

          # Unix timestamp
          sig { returns(Float) }
          attr_accessor :timestamp

          # ISO 8601 timestamp
          sig { returns(Time) }
          attr_accessor :timestamp_iso

          # SMTP response code
          sig { returns(T.nilable(Integer)) }
          attr_reader :code

          sig { params(code: Integer).void }
          attr_writer :code

          # Status details
          sig { returns(T.nilable(String)) }
          attr_reader :details

          sig { params(details: String).void }
          attr_writer :details

          # SMTP server response from the receiving mail server
          sig { returns(T.nilable(String)) }
          attr_reader :output

          sig { params(output: String).void }
          attr_writer :output

          # Whether TLS was used
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :sent_with_ssl

          sig { params(sent_with_ssl: T::Boolean).void }
          attr_writer :sent_with_ssl

          sig do
            params(
              id: String,
              status: String,
              timestamp: Float,
              timestamp_iso: Time,
              code: Integer,
              details: String,
              output: String,
              sent_with_ssl: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Delivery attempt ID
            id:,
            # Delivery status (lowercase)
            status:,
            # Unix timestamp
            timestamp:,
            # ISO 8601 timestamp
            timestamp_iso:,
            # SMTP response code
            code: nil,
            # Status details
            details: nil,
            # SMTP server response from the receiving mail server
            output: nil,
            # Whether TLS was used
            sent_with_ssl: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                status: String,
                timestamp: Float,
                timestamp_iso: Time,
                code: Integer,
                details: String,
                output: String,
                sent_with_ssl: T::Boolean
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
