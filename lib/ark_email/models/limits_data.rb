# frozen_string_literal: true

module ArkEmail
  module Models
    class LimitsData < ArkEmail::Internal::Type::BaseModel
      # @!attribute billing
      #   Billing and credit information
      #
      #   @return [ArkEmail::Models::LimitsData::Billing, nil]
      required :billing, -> { ArkEmail::LimitsData::Billing }, nil?: true

      # @!attribute rate_limit
      #   API rate limit status
      #
      #   @return [ArkEmail::Models::LimitsData::RateLimit]
      required :rate_limit, -> { ArkEmail::LimitsData::RateLimit }, api_name: :rateLimit

      # @!attribute send_limit
      #   Email send limit status (hourly cap)
      #
      #   @return [ArkEmail::Models::LimitsData::SendLimit, nil]
      required :send_limit, -> { ArkEmail::LimitsData::SendLimit }, api_name: :sendLimit, nil?: true

      # @!method initialize(billing:, rate_limit:, send_limit:)
      #   Current usage and limit information
      #
      #   @param billing [ArkEmail::Models::LimitsData::Billing, nil] Billing and credit information
      #
      #   @param rate_limit [ArkEmail::Models::LimitsData::RateLimit] API rate limit status
      #
      #   @param send_limit [ArkEmail::Models::LimitsData::SendLimit, nil] Email send limit status (hourly cap)

      # @see ArkEmail::Models::LimitsData#billing
      class Billing < ArkEmail::Internal::Type::BaseModel
        # @!attribute auto_recharge
        #   Auto-recharge configuration
        #
        #   @return [ArkEmail::Models::LimitsData::Billing::AutoRecharge]
        required :auto_recharge, -> { ArkEmail::LimitsData::Billing::AutoRecharge }, api_name: :autoRecharge

        # @!attribute credit_balance
        #   Current credit balance as formatted string (e.g., "25.50")
        #
        #   @return [String]
        required :credit_balance, String, api_name: :creditBalance

        # @!attribute credit_balance_cents
        #   Current credit balance in cents for precise calculations
        #
        #   @return [Integer]
        required :credit_balance_cents, Integer, api_name: :creditBalanceCents

        # @!attribute has_payment_method
        #   Whether a payment method is configured
        #
        #   @return [Boolean]
        required :has_payment_method, ArkEmail::Internal::Type::Boolean, api_name: :hasPaymentMethod

        # @!method initialize(auto_recharge:, credit_balance:, credit_balance_cents:, has_payment_method:)
        #   Billing and credit information
        #
        #   @param auto_recharge [ArkEmail::Models::LimitsData::Billing::AutoRecharge] Auto-recharge configuration
        #
        #   @param credit_balance [String] Current credit balance as formatted string (e.g., "25.50")
        #
        #   @param credit_balance_cents [Integer] Current credit balance in cents for precise calculations
        #
        #   @param has_payment_method [Boolean] Whether a payment method is configured

        # @see ArkEmail::Models::LimitsData::Billing#auto_recharge
        class AutoRecharge < ArkEmail::Internal::Type::BaseModel
          # @!attribute amount
          #   Amount to recharge when triggered
          #
          #   @return [String]
          required :amount, String

          # @!attribute enabled
          #   Whether auto-recharge is enabled
          #
          #   @return [Boolean]
          required :enabled, ArkEmail::Internal::Type::Boolean

          # @!attribute threshold
          #   Balance threshold that triggers recharge
          #
          #   @return [String]
          required :threshold, String

          # @!method initialize(amount:, enabled:, threshold:)
          #   Auto-recharge configuration
          #
          #   @param amount [String] Amount to recharge when triggered
          #
          #   @param enabled [Boolean] Whether auto-recharge is enabled
          #
          #   @param threshold [String] Balance threshold that triggers recharge
        end
      end

      # @see ArkEmail::Models::LimitsData#rate_limit
      class RateLimit < ArkEmail::Internal::Type::BaseModel
        # @!attribute limit
        #   Maximum requests allowed per period
        #
        #   @return [Integer]
        required :limit, Integer

        # @!attribute period
        #   Time period for the limit
        #
        #   @return [Symbol, ArkEmail::Models::LimitsData::RateLimit::Period]
        required :period, enum: -> { ArkEmail::LimitsData::RateLimit::Period }

        # @!attribute remaining
        #   Requests remaining in current window
        #
        #   @return [Integer]
        required :remaining, Integer

        # @!attribute reset
        #   Unix timestamp when the limit resets
        #
        #   @return [Integer]
        required :reset, Integer

        # @!method initialize(limit:, period:, remaining:, reset:)
        #   API rate limit status
        #
        #   @param limit [Integer] Maximum requests allowed per period
        #
        #   @param period [Symbol, ArkEmail::Models::LimitsData::RateLimit::Period] Time period for the limit
        #
        #   @param remaining [Integer] Requests remaining in current window
        #
        #   @param reset [Integer] Unix timestamp when the limit resets

        # Time period for the limit
        #
        # @see ArkEmail::Models::LimitsData::RateLimit#period
        module Period
          extend ArkEmail::Internal::Type::Enum

          SECOND = :second

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ArkEmail::Models::LimitsData#send_limit
      class SendLimit < ArkEmail::Internal::Type::BaseModel
        # @!attribute approaching
        #   Whether approaching the limit (>90%)
        #
        #   @return [Boolean]
        required :approaching, ArkEmail::Internal::Type::Boolean

        # @!attribute exceeded
        #   Whether the limit has been exceeded
        #
        #   @return [Boolean]
        required :exceeded, ArkEmail::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum emails allowed per hour (null = unlimited)
        #
        #   @return [Integer, nil]
        required :limit, Integer, nil?: true

        # @!attribute period
        #   Time period for the limit
        #
        #   @return [Symbol, ArkEmail::Models::LimitsData::SendLimit::Period]
        required :period, enum: -> { ArkEmail::LimitsData::SendLimit::Period }

        # @!attribute remaining
        #   Emails remaining in current period (null if unlimited)
        #
        #   @return [Integer, nil]
        required :remaining, Integer, nil?: true

        # @!attribute resets_at
        #   ISO timestamp when the limit window resets (top of next hour)
        #
        #   @return [Time]
        required :resets_at, Time, api_name: :resetsAt

        # @!attribute usage_percent
        #   Usage as a percentage (null if unlimited)
        #
        #   @return [Float, nil]
        required :usage_percent, Float, api_name: :usagePercent, nil?: true

        # @!attribute used
        #   Emails sent in current period
        #
        #   @return [Integer]
        required :used, Integer

        # @!method initialize(approaching:, exceeded:, limit:, period:, remaining:, resets_at:, usage_percent:, used:)
        #   Email send limit status (hourly cap)
        #
        #   @param approaching [Boolean] Whether approaching the limit (>90%)
        #
        #   @param exceeded [Boolean] Whether the limit has been exceeded
        #
        #   @param limit [Integer, nil] Maximum emails allowed per hour (null = unlimited)
        #
        #   @param period [Symbol, ArkEmail::Models::LimitsData::SendLimit::Period] Time period for the limit
        #
        #   @param remaining [Integer, nil] Emails remaining in current period (null if unlimited)
        #
        #   @param resets_at [Time] ISO timestamp when the limit window resets (top of next hour)
        #
        #   @param usage_percent [Float, nil] Usage as a percentage (null if unlimited)
        #
        #   @param used [Integer] Emails sent in current period

        # Time period for the limit
        #
        # @see ArkEmail::Models::LimitsData::SendLimit#period
        module Period
          extend ArkEmail::Internal::Type::Enum

          HOUR = :hour

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
