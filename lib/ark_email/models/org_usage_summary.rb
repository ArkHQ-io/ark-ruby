# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Usage#retrieve
    class OrgUsageSummary < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::OrgUsageSummary::Data]
      required :data, -> { ArkEmail::OrgUsageSummary::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   Org-wide usage summary response
      #
      #   @param data [ArkEmail::Models::OrgUsageSummary::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::OrgUsageSummary#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute emails
        #   Email delivery counts
        #
        #   @return [ArkEmail::Models::EmailCounts]
        required :emails, -> { ArkEmail::EmailCounts }

        # @!attribute period
        #   Time period for usage data
        #
        #   @return [ArkEmail::Models::UsagePeriod]
        required :period, -> { ArkEmail::UsagePeriod }

        # @!attribute rates
        #   Email delivery rates (as decimals, e.g., 0.95 = 95%)
        #
        #   @return [ArkEmail::Models::EmailRates]
        required :rates, -> { ArkEmail::EmailRates }

        # @!attribute tenants
        #
        #   @return [ArkEmail::Models::OrgUsageSummary::Data::Tenants]
        required :tenants, -> { ArkEmail::OrgUsageSummary::Data::Tenants }

        # @!method initialize(emails:, period:, rates:, tenants:)
        #   @param emails [ArkEmail::Models::EmailCounts] Email delivery counts
        #
        #   @param period [ArkEmail::Models::UsagePeriod] Time period for usage data
        #
        #   @param rates [ArkEmail::Models::EmailRates] Email delivery rates (as decimals, e.g., 0.95 = 95%)
        #
        #   @param tenants [ArkEmail::Models::OrgUsageSummary::Data::Tenants]

        # @see ArkEmail::Models::OrgUsageSummary::Data#tenants
        class Tenants < ArkEmail::Internal::Type::BaseModel
          # @!attribute active
          #   Number of active tenants
          #
          #   @return [Integer]
          required :active, Integer

          # @!attribute total
          #   Total number of tenants
          #
          #   @return [Integer]
          required :total, Integer

          # @!attribute with_activity
          #   Number of tenants with sending activity
          #
          #   @return [Integer]
          required :with_activity, Integer, api_name: :withActivity

          # @!method initialize(active:, total:, with_activity:)
          #   @param active [Integer] Number of active tenants
          #
          #   @param total [Integer] Total number of tenants
          #
          #   @param with_activity [Integer] Number of tenants with sending activity
        end
      end
    end
  end
end
