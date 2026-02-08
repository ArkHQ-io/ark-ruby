# typed: strong

module ArkEmail
  module Models
    module Tenants
      class TrackDomain < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::Tenants::TrackDomain, ArkEmail::Internal::AnyHash)
          end

        # Track domain ID
        sig { returns(String) }
        attr_accessor :id

        # When the track domain was created
        sig { returns(Time) }
        attr_accessor :created_at

        # Whether the tracking CNAME record is correctly configured. Must be true to use
        # tracking features.
        sig { returns(T::Boolean) }
        attr_accessor :dns_ok

        # ID of the parent sending domain
        sig { returns(String) }
        attr_accessor :domain_id

        # Full domain name
        sig { returns(String) }
        attr_accessor :full_name

        # Subdomain name
        sig { returns(String) }
        attr_accessor :name

        # Whether SSL is enabled for tracking URLs
        sig { returns(T::Boolean) }
        attr_accessor :ssl_enabled

        # Whether click tracking is enabled
        sig { returns(T::Boolean) }
        attr_accessor :track_clicks

        # Whether open tracking is enabled
        sig { returns(T::Boolean) }
        attr_accessor :track_opens

        # When DNS was last checked
        sig { returns(T.nilable(Time)) }
        attr_accessor :dns_checked_at

        # DNS error message if verification failed
        sig { returns(T.nilable(String)) }
        attr_accessor :dns_error

        # Required DNS record configuration
        sig { returns(T.nilable(ArkEmail::Tenants::TrackDomain::DNSRecord)) }
        attr_reader :dns_record

        sig do
          params(
            dns_record:
              T.nilable(ArkEmail::Tenants::TrackDomain::DNSRecord::OrHash)
          ).void
        end
        attr_writer :dns_record

        # Current DNS verification status
        sig do
          returns(
            T.nilable(ArkEmail::Tenants::TrackDomain::DNSStatus::TaggedSymbol)
          )
        end
        attr_accessor :dns_status

        # Domains excluded from click tracking
        sig { returns(T.nilable(String)) }
        attr_accessor :excluded_click_domains

        # When the track domain was last updated
        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            created_at: Time,
            dns_ok: T::Boolean,
            domain_id: String,
            full_name: String,
            name: String,
            ssl_enabled: T::Boolean,
            track_clicks: T::Boolean,
            track_opens: T::Boolean,
            dns_checked_at: T.nilable(Time),
            dns_error: T.nilable(String),
            dns_record:
              T.nilable(ArkEmail::Tenants::TrackDomain::DNSRecord::OrHash),
            dns_status:
              T.nilable(ArkEmail::Tenants::TrackDomain::DNSStatus::OrSymbol),
            excluded_click_domains: T.nilable(String),
            updated_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          # Track domain ID
          id:,
          # When the track domain was created
          created_at:,
          # Whether the tracking CNAME record is correctly configured. Must be true to use
          # tracking features.
          dns_ok:,
          # ID of the parent sending domain
          domain_id:,
          # Full domain name
          full_name:,
          # Subdomain name
          name:,
          # Whether SSL is enabled for tracking URLs
          ssl_enabled:,
          # Whether click tracking is enabled
          track_clicks:,
          # Whether open tracking is enabled
          track_opens:,
          # When DNS was last checked
          dns_checked_at: nil,
          # DNS error message if verification failed
          dns_error: nil,
          # Required DNS record configuration
          dns_record: nil,
          # Current DNS verification status
          dns_status: nil,
          # Domains excluded from click tracking
          excluded_click_domains: nil,
          # When the track domain was last updated
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              dns_ok: T::Boolean,
              domain_id: String,
              full_name: String,
              name: String,
              ssl_enabled: T::Boolean,
              track_clicks: T::Boolean,
              track_opens: T::Boolean,
              dns_checked_at: T.nilable(Time),
              dns_error: T.nilable(String),
              dns_record: T.nilable(ArkEmail::Tenants::TrackDomain::DNSRecord),
              dns_status:
                T.nilable(
                  ArkEmail::Tenants::TrackDomain::DNSStatus::TaggedSymbol
                ),
              excluded_click_domains: T.nilable(String),
              updated_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end

        class DNSRecord < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Tenants::TrackDomain::DNSRecord,
                ArkEmail::Internal::AnyHash
              )
            end

          # DNS record name
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # DNS record type
          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          # DNS record value (target)
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
          def self.new(
            # DNS record name
            name: nil,
            # DNS record type
            type: nil,
            # DNS record value (target)
            value: nil
          )
          end

          sig do
            override.returns({ name: String, type: String, value: String })
          end
          def to_hash
          end
        end

        # Current DNS verification status
        module DNSStatus
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ArkEmail::Tenants::TrackDomain::DNSStatus)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OK =
            T.let(:ok, ArkEmail::Tenants::TrackDomain::DNSStatus::TaggedSymbol)
          MISSING =
            T.let(
              :missing,
              ArkEmail::Tenants::TrackDomain::DNSStatus::TaggedSymbol
            )
          INVALID =
            T.let(
              :invalid,
              ArkEmail::Tenants::TrackDomain::DNSStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[ArkEmail::Tenants::TrackDomain::DNSStatus::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
