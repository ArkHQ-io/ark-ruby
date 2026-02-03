# typed: strong

module ArkEmail
  module Models
    class LimitsData < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::LimitsData, ArkEmail::Internal::AnyHash)
        end

      # Billing and credit information
      sig { returns(T.nilable(ArkEmail::LimitsData::Billing)) }
      attr_reader :billing

      sig do
        params(billing: T.nilable(ArkEmail::LimitsData::Billing::OrHash)).void
      end
      attr_writer :billing

      # API rate limit status
      sig { returns(ArkEmail::LimitsData::RateLimit) }
      attr_reader :rate_limit

      sig { params(rate_limit: ArkEmail::LimitsData::RateLimit::OrHash).void }
      attr_writer :rate_limit

      # Email send limit status (hourly cap)
      sig { returns(T.nilable(ArkEmail::LimitsData::SendLimit)) }
      attr_reader :send_limit

      sig do
        params(
          send_limit: T.nilable(ArkEmail::LimitsData::SendLimit::OrHash)
        ).void
      end
      attr_writer :send_limit

      # Current usage and limit information
      sig do
        params(
          billing: T.nilable(ArkEmail::LimitsData::Billing::OrHash),
          rate_limit: ArkEmail::LimitsData::RateLimit::OrHash,
          send_limit: T.nilable(ArkEmail::LimitsData::SendLimit::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Billing and credit information
        billing:,
        # API rate limit status
        rate_limit:,
        # Email send limit status (hourly cap)
        send_limit:
      )
      end

      sig do
        override.returns(
          {
            billing: T.nilable(ArkEmail::LimitsData::Billing),
            rate_limit: ArkEmail::LimitsData::RateLimit,
            send_limit: T.nilable(ArkEmail::LimitsData::SendLimit)
          }
        )
      end
      def to_hash
      end

      class Billing < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LimitsData::Billing, ArkEmail::Internal::AnyHash)
          end

        # Auto-recharge configuration
        sig { returns(ArkEmail::LimitsData::Billing::AutoRecharge) }
        attr_reader :auto_recharge

        sig do
          params(
            auto_recharge: ArkEmail::LimitsData::Billing::AutoRecharge::OrHash
          ).void
        end
        attr_writer :auto_recharge

        # Current credit balance as formatted string (e.g., "25.50")
        sig { returns(String) }
        attr_accessor :credit_balance

        # Current credit balance in cents for precise calculations
        sig { returns(Integer) }
        attr_accessor :credit_balance_cents

        # Whether a payment method is configured
        sig { returns(T::Boolean) }
        attr_accessor :has_payment_method

        # Billing and credit information
        sig do
          params(
            auto_recharge: ArkEmail::LimitsData::Billing::AutoRecharge::OrHash,
            credit_balance: String,
            credit_balance_cents: Integer,
            has_payment_method: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # Auto-recharge configuration
          auto_recharge:,
          # Current credit balance as formatted string (e.g., "25.50")
          credit_balance:,
          # Current credit balance in cents for precise calculations
          credit_balance_cents:,
          # Whether a payment method is configured
          has_payment_method:
        )
        end

        sig do
          override.returns(
            {
              auto_recharge: ArkEmail::LimitsData::Billing::AutoRecharge,
              credit_balance: String,
              credit_balance_cents: Integer,
              has_payment_method: T::Boolean
            }
          )
        end
        def to_hash
        end

        class AutoRecharge < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::LimitsData::Billing::AutoRecharge,
                ArkEmail::Internal::AnyHash
              )
            end

          # Amount to recharge when triggered
          sig { returns(String) }
          attr_accessor :amount

          # Whether auto-recharge is enabled
          sig { returns(T::Boolean) }
          attr_accessor :enabled

          # Balance threshold that triggers recharge
          sig { returns(String) }
          attr_accessor :threshold

          # Auto-recharge configuration
          sig do
            params(
              amount: String,
              enabled: T::Boolean,
              threshold: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Amount to recharge when triggered
            amount:,
            # Whether auto-recharge is enabled
            enabled:,
            # Balance threshold that triggers recharge
            threshold:
          )
          end

          sig do
            override.returns(
              { amount: String, enabled: T::Boolean, threshold: String }
            )
          end
          def to_hash
          end
        end
      end

      class RateLimit < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LimitsData::RateLimit, ArkEmail::Internal::AnyHash)
          end

        # Maximum requests allowed per period
        sig { returns(Integer) }
        attr_accessor :limit

        # Time period for the limit
        sig { returns(ArkEmail::LimitsData::RateLimit::Period::TaggedSymbol) }
        attr_accessor :period

        # Requests remaining in current window
        sig { returns(Integer) }
        attr_accessor :remaining

        # Unix timestamp when the limit resets
        sig { returns(Integer) }
        attr_accessor :reset

        # API rate limit status
        sig do
          params(
            limit: Integer,
            period: ArkEmail::LimitsData::RateLimit::Period::OrSymbol,
            remaining: Integer,
            reset: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Maximum requests allowed per period
          limit:,
          # Time period for the limit
          period:,
          # Requests remaining in current window
          remaining:,
          # Unix timestamp when the limit resets
          reset:
        )
        end

        sig do
          override.returns(
            {
              limit: Integer,
              period: ArkEmail::LimitsData::RateLimit::Period::TaggedSymbol,
              remaining: Integer,
              reset: Integer
            }
          )
        end
        def to_hash
        end

        # Time period for the limit
        module Period
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ArkEmail::LimitsData::RateLimit::Period)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SECOND =
            T.let(
              :second,
              ArkEmail::LimitsData::RateLimit::Period::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[ArkEmail::LimitsData::RateLimit::Period::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class SendLimit < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(ArkEmail::LimitsData::SendLimit, ArkEmail::Internal::AnyHash)
          end

        # Whether approaching the limit (>90%)
        sig { returns(T::Boolean) }
        attr_accessor :approaching

        # Whether the limit has been exceeded
        sig { returns(T::Boolean) }
        attr_accessor :exceeded

        # Maximum emails allowed per hour (null = unlimited)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        # Time period for the limit
        sig { returns(ArkEmail::LimitsData::SendLimit::Period::TaggedSymbol) }
        attr_accessor :period

        # Emails remaining in current period (null if unlimited)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :remaining

        # ISO timestamp when the limit window resets (top of next hour)
        sig { returns(Time) }
        attr_accessor :resets_at

        # Usage as a percentage (null if unlimited)
        sig { returns(T.nilable(Float)) }
        attr_accessor :usage_percent

        # Emails sent in current period
        sig { returns(Integer) }
        attr_accessor :used

        # Email send limit status (hourly cap)
        sig do
          params(
            approaching: T::Boolean,
            exceeded: T::Boolean,
            limit: T.nilable(Integer),
            period: ArkEmail::LimitsData::SendLimit::Period::OrSymbol,
            remaining: T.nilable(Integer),
            resets_at: Time,
            usage_percent: T.nilable(Float),
            used: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether approaching the limit (>90%)
          approaching:,
          # Whether the limit has been exceeded
          exceeded:,
          # Maximum emails allowed per hour (null = unlimited)
          limit:,
          # Time period for the limit
          period:,
          # Emails remaining in current period (null if unlimited)
          remaining:,
          # ISO timestamp when the limit window resets (top of next hour)
          resets_at:,
          # Usage as a percentage (null if unlimited)
          usage_percent:,
          # Emails sent in current period
          used:
        )
        end

        sig do
          override.returns(
            {
              approaching: T::Boolean,
              exceeded: T::Boolean,
              limit: T.nilable(Integer),
              period: ArkEmail::LimitsData::SendLimit::Period::TaggedSymbol,
              remaining: T.nilable(Integer),
              resets_at: Time,
              usage_percent: T.nilable(Float),
              used: Integer
            }
          )
        end
        def to_hash
        end

        # Time period for the limit
        module Period
          extend ArkEmail::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ArkEmail::LimitsData::SendLimit::Period)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HOUR =
            T.let(:hour, ArkEmail::LimitsData::SendLimit::Period::TaggedSymbol)

          sig do
            override.returns(
              T::Array[ArkEmail::LimitsData::SendLimit::Period::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
