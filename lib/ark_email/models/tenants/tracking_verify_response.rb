# frozen_string_literal: true

module ArkEmail
  module Models
    module Tenants
      # @see ArkEmail::Resources::Tenants::Tracking#verify
      class TrackingVerifyResponse < ArkEmail::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [ArkEmail::Models::Tenants::TrackingVerifyResponse::Data]
        required :data, -> { ArkEmail::Models::Tenants::TrackingVerifyResponse::Data }

        # @!attribute meta
        #
        #   @return [ArkEmail::Models::APIMeta]
        required :meta, -> { ArkEmail::APIMeta }

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!method initialize(data:, meta:, success: true)
        #   @param data [ArkEmail::Models::Tenants::TrackingVerifyResponse::Data]
        #   @param meta [ArkEmail::Models::APIMeta]
        #   @param success [Boolean, true]

        # @see ArkEmail::Models::Tenants::TrackingVerifyResponse#data
        class Data < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Track domain ID
          #
          #   @return [String]
          required :id, String

          # @!attribute dns_ok
          #   Whether DNS is correctly configured
          #
          #   @return [Boolean]
          required :dns_ok, ArkEmail::Internal::Type::Boolean, api_name: :dnsOk

          # @!attribute dns_status
          #   Current DNS verification status
          #
          #   @return [Symbol, ArkEmail::Models::Tenants::TrackingVerifyResponse::Data::DNSStatus, nil]
          required :dns_status,
                   enum: -> { ArkEmail::Models::Tenants::TrackingVerifyResponse::Data::DNSStatus },
                   api_name: :dnsStatus,
                   nil?: true

          # @!attribute full_name
          #   Full domain name
          #
          #   @return [String]
          required :full_name, String, api_name: :fullName

          # @!attribute dns_checked_at
          #   When DNS was last checked
          #
          #   @return [Time, nil]
          optional :dns_checked_at, Time, api_name: :dnsCheckedAt, nil?: true

          # @!attribute dns_error
          #   DNS error message if verification failed
          #
          #   @return [String, nil]
          optional :dns_error, String, api_name: :dnsError, nil?: true

          # @!attribute dns_record
          #   Required DNS record configuration
          #
          #   @return [ArkEmail::Models::Tenants::TrackingVerifyResponse::Data::DNSRecord, nil]
          optional :dns_record,
                   -> { ArkEmail::Models::Tenants::TrackingVerifyResponse::Data::DNSRecord },
                   api_name: :dnsRecord,
                   nil?: true

          # @!method initialize(id:, dns_ok:, dns_status:, full_name:, dns_checked_at: nil, dns_error: nil, dns_record: nil)
          #   @param id [String] Track domain ID
          #
          #   @param dns_ok [Boolean] Whether DNS is correctly configured
          #
          #   @param dns_status [Symbol, ArkEmail::Models::Tenants::TrackingVerifyResponse::Data::DNSStatus, nil] Current DNS verification status
          #
          #   @param full_name [String] Full domain name
          #
          #   @param dns_checked_at [Time, nil] When DNS was last checked
          #
          #   @param dns_error [String, nil] DNS error message if verification failed
          #
          #   @param dns_record [ArkEmail::Models::Tenants::TrackingVerifyResponse::Data::DNSRecord, nil] Required DNS record configuration

          # Current DNS verification status
          #
          # @see ArkEmail::Models::Tenants::TrackingVerifyResponse::Data#dns_status
          module DNSStatus
            extend ArkEmail::Internal::Type::Enum

            OK = :ok
            MISSING = :missing
            INVALID = :invalid

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ArkEmail::Models::Tenants::TrackingVerifyResponse::Data#dns_record
          class DNSRecord < ArkEmail::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String, nil]
            optional :name, String

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String

            # @!attribute value
            #
            #   @return [String, nil]
            optional :value, String

            # @!method initialize(name: nil, type: nil, value: nil)
            #   Required DNS record configuration
            #
            #   @param name [String]
            #   @param type [String]
            #   @param value [String]
          end
        end
      end
    end
  end
end
