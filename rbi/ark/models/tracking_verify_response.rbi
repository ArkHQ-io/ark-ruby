# typed: strong

module Ark
  module Models
    class TrackingVerifyResponse < Ark::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Ark::Models::TrackingVerifyResponse, Ark::Internal::AnyHash)
        end

      sig { returns(Ark::Models::TrackingVerifyResponse::Data) }
      attr_reader :data

      sig do
        params(data: Ark::Models::TrackingVerifyResponse::Data::OrHash).void
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
          data: Ark::Models::TrackingVerifyResponse::Data::OrHash,
          meta: Ark::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: Ark::Models::TrackingVerifyResponse::Data,
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
              Ark::Models::TrackingVerifyResponse::Data,
              Ark::Internal::AnyHash
            )
          end

        # Track domain ID
        sig { returns(String) }
        attr_accessor :id

        # Whether DNS is correctly configured
        sig { returns(T::Boolean) }
        attr_accessor :dns_ok

        # Current DNS verification status
        sig do
          returns(
            T.nilable(
              Ark::Models::TrackingVerifyResponse::Data::DNSStatus::TaggedSymbol
            )
          )
        end
        attr_accessor :dns_status

        # Full domain name
        sig { returns(String) }
        attr_accessor :full_name

        # When DNS was last checked
        sig { returns(T.nilable(Time)) }
        attr_accessor :dns_checked_at

        # DNS error message if verification failed
        sig { returns(T.nilable(String)) }
        attr_accessor :dns_error

        # Required DNS record configuration
        sig do
          returns(
            T.nilable(Ark::Models::TrackingVerifyResponse::Data::DNSRecord)
          )
        end
        attr_reader :dns_record

        sig do
          params(
            dns_record:
              T.nilable(
                Ark::Models::TrackingVerifyResponse::Data::DNSRecord::OrHash
              )
          ).void
        end
        attr_writer :dns_record

        sig do
          params(
            id: String,
            dns_ok: T::Boolean,
            dns_status:
              T.nilable(
                Ark::Models::TrackingVerifyResponse::Data::DNSStatus::OrSymbol
              ),
            full_name: String,
            dns_checked_at: T.nilable(Time),
            dns_error: T.nilable(String),
            dns_record:
              T.nilable(
                Ark::Models::TrackingVerifyResponse::Data::DNSRecord::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Track domain ID
          id:,
          # Whether DNS is correctly configured
          dns_ok:,
          # Current DNS verification status
          dns_status:,
          # Full domain name
          full_name:,
          # When DNS was last checked
          dns_checked_at: nil,
          # DNS error message if verification failed
          dns_error: nil,
          # Required DNS record configuration
          dns_record: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              dns_ok: T::Boolean,
              dns_status:
                T.nilable(
                  Ark::Models::TrackingVerifyResponse::Data::DNSStatus::TaggedSymbol
                ),
              full_name: String,
              dns_checked_at: T.nilable(Time),
              dns_error: T.nilable(String),
              dns_record:
                T.nilable(Ark::Models::TrackingVerifyResponse::Data::DNSRecord)
            }
          )
        end
        def to_hash
        end

        # Current DNS verification status
        module DNSStatus
          extend Ark::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Ark::Models::TrackingVerifyResponse::Data::DNSStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OK =
            T.let(
              :ok,
              Ark::Models::TrackingVerifyResponse::Data::DNSStatus::TaggedSymbol
            )
          MISSING =
            T.let(
              :missing,
              Ark::Models::TrackingVerifyResponse::Data::DNSStatus::TaggedSymbol
            )
          INVALID =
            T.let(
              :invalid,
              Ark::Models::TrackingVerifyResponse::Data::DNSStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Ark::Models::TrackingVerifyResponse::Data::DNSStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class DNSRecord < Ark::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Ark::Models::TrackingVerifyResponse::Data::DNSRecord,
                Ark::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          sig { returns(T.nilable(String)) }
          attr_reader :value

          sig { params(value: String).void }
          attr_writer :value

          # Required DNS record configuration
          sig do
            params(name: String, type: String, value: String).returns(
              T.attached_class
            )
          end
          def self.new(name: nil, type: nil, value: nil)
          end

          sig do
            override.returns({ name: String, type: String, value: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end
