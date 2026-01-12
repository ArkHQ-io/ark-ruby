# frozen_string_literal: true

module Ark
  module Models
    class TrackDomain < Ark::Internal::Type::BaseModel
      # @!attribute id
      #   Track domain ID
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When the track domain was created
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute dns_ok
      #   Whether DNS is correctly configured
      #
      #   @return [Boolean]
      required :dns_ok, Ark::Internal::Type::Boolean, api_name: :dnsOk

      # @!attribute domain_id
      #   ID of the parent sending domain
      #
      #   @return [String]
      required :domain_id, String, api_name: :domainId

      # @!attribute full_name
      #   Full domain name
      #
      #   @return [String]
      required :full_name, String, api_name: :fullName

      # @!attribute name
      #   Subdomain name
      #
      #   @return [String]
      required :name, String

      # @!attribute ssl_enabled
      #   Whether SSL is enabled for tracking URLs
      #
      #   @return [Boolean]
      required :ssl_enabled, Ark::Internal::Type::Boolean, api_name: :sslEnabled

      # @!attribute track_clicks
      #   Whether click tracking is enabled
      #
      #   @return [Boolean]
      required :track_clicks, Ark::Internal::Type::Boolean, api_name: :trackClicks

      # @!attribute track_opens
      #   Whether open tracking is enabled
      #
      #   @return [Boolean]
      required :track_opens, Ark::Internal::Type::Boolean, api_name: :trackOpens

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
      #   @return [Ark::Models::TrackDomain::DNSRecord, nil]
      optional :dns_record, -> { Ark::TrackDomain::DNSRecord }, api_name: :dnsRecord, nil?: true

      # @!attribute dns_status
      #   Current DNS verification status
      #
      #   @return [Symbol, Ark::Models::TrackDomain::DNSStatus, nil]
      optional :dns_status, enum: -> { Ark::TrackDomain::DNSStatus }, api_name: :dnsStatus, nil?: true

      # @!attribute excluded_click_domains
      #   Domains excluded from click tracking
      #
      #   @return [String, nil]
      optional :excluded_click_domains, String, api_name: :excludedClickDomains, nil?: true

      # @!attribute updated_at
      #   When the track domain was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt, nil?: true

      # @!method initialize(id:, created_at:, dns_ok:, domain_id:, full_name:, name:, ssl_enabled:, track_clicks:, track_opens:, dns_checked_at: nil, dns_error: nil, dns_record: nil, dns_status: nil, excluded_click_domains: nil, updated_at: nil)
      #   @param id [String] Track domain ID
      #
      #   @param created_at [Time] When the track domain was created
      #
      #   @param dns_ok [Boolean] Whether DNS is correctly configured
      #
      #   @param domain_id [String] ID of the parent sending domain
      #
      #   @param full_name [String] Full domain name
      #
      #   @param name [String] Subdomain name
      #
      #   @param ssl_enabled [Boolean] Whether SSL is enabled for tracking URLs
      #
      #   @param track_clicks [Boolean] Whether click tracking is enabled
      #
      #   @param track_opens [Boolean] Whether open tracking is enabled
      #
      #   @param dns_checked_at [Time, nil] When DNS was last checked
      #
      #   @param dns_error [String, nil] DNS error message if verification failed
      #
      #   @param dns_record [Ark::Models::TrackDomain::DNSRecord, nil] Required DNS record configuration
      #
      #   @param dns_status [Symbol, Ark::Models::TrackDomain::DNSStatus, nil] Current DNS verification status
      #
      #   @param excluded_click_domains [String, nil] Domains excluded from click tracking
      #
      #   @param updated_at [Time, nil] When the track domain was last updated

      # @see Ark::Models::TrackDomain#dns_record
      class DNSRecord < Ark::Internal::Type::BaseModel
        # @!attribute name
        #   DNS record name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute type
        #   DNS record type
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute value
        #   DNS record value (target)
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(name: nil, type: nil, value: nil)
        #   Required DNS record configuration
        #
        #   @param name [String] DNS record name
        #
        #   @param type [String] DNS record type
        #
        #   @param value [String] DNS record value (target)
      end

      # Current DNS verification status
      #
      # @see Ark::Models::TrackDomain#dns_status
      module DNSStatus
        extend Ark::Internal::Type::Enum

        OK = :ok
        MISSING = :missing
        INVALID = :invalid

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
