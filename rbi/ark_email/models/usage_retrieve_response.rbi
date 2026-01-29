# typed: strong

module ArkEmail
  module Models
    class UsageRetrieveResponse < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::UsageRetrieveResponse,
            ArkEmail::Internal::AnyHash
          )
        end

      # Current usage and limit information
      sig { returns(ArkEmail::Models::UsageRetrieveResponse::Data) }
      attr_reader :data

      sig do
        params(data: ArkEmail::Models::UsageRetrieveResponse::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Account usage and limits response
      sig do
        params(
          data: ArkEmail::Models::UsageRetrieveResponse::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Current usage and limit information
        data:,
        meta:,
        success: true
      )
      end

      sig do
        override.returns(
          {
            data: ArkEmail::Models::UsageRetrieveResponse::Data,
            meta: ArkEmail::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::UsageRetrieveResponse::Data,
              ArkEmail::Internal::AnyHash
            )
          end

        # Billing and credit information
        sig do
          returns(
            T.nilable(ArkEmail::Models::UsageRetrieveResponse::Data::Billing)
          )
        end
        attr_reader :billing

        sig do
          params(
            billing:
              T.nilable(
                ArkEmail::Models::UsageRetrieveResponse::Data::Billing::OrHash
              )
          ).void
        end
        attr_writer :billing

        # API rate limit status
        sig do
          returns(ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit)
        end
        attr_reader :rate_limit

        sig do
          params(
            rate_limit:
              ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::OrHash
          ).void
        end
        attr_writer :rate_limit

        # Email send limit status (hourly cap)
        sig do
          returns(
            T.nilable(ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit)
          )
        end
        attr_reader :send_limit

        sig do
          params(
            send_limit:
              T.nilable(
                ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::OrHash
              )
          ).void
        end
        attr_writer :send_limit

        # Current usage and limit information
        sig do
          params(
            billing:
              T.nilable(
                ArkEmail::Models::UsageRetrieveResponse::Data::Billing::OrHash
              ),
            rate_limit:
              ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::OrHash,
            send_limit:
              T.nilable(
                ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::OrHash
              )
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
              billing:
                T.nilable(
                  ArkEmail::Models::UsageRetrieveResponse::Data::Billing
                ),
              rate_limit:
                ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit,
              send_limit:
                T.nilable(
                  ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit
                )
            }
          )
        end
        def to_hash
        end

        class Billing < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::UsageRetrieveResponse::Data::Billing,
                ArkEmail::Internal::AnyHash
              )
            end

          # Auto-recharge configuration
          sig do
            returns(
              ArkEmail::Models::UsageRetrieveResponse::Data::Billing::AutoRecharge
            )
          end
          attr_reader :auto_recharge

          sig do
            params(
              auto_recharge:
                ArkEmail::Models::UsageRetrieveResponse::Data::Billing::AutoRecharge::OrHash
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
              auto_recharge:
                ArkEmail::Models::UsageRetrieveResponse::Data::Billing::AutoRecharge::OrHash,
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
                auto_recharge:
                  ArkEmail::Models::UsageRetrieveResponse::Data::Billing::AutoRecharge,
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
                  ArkEmail::Models::UsageRetrieveResponse::Data::Billing::AutoRecharge,
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
              T.any(
                ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit,
                ArkEmail::Internal::AnyHash
              )
            end

          # Maximum requests allowed per period
          sig { returns(Integer) }
          attr_accessor :limit

          # Time period for the limit
          sig do
            returns(
              ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::Period::TaggedSymbol
            )
          end
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
              period:
                ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::Period::OrSymbol,
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
                period:
                  ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::Period::TaggedSymbol,
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
                T.all(
                  Symbol,
                  ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::Period
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SECOND =
              T.let(
                :second,
                ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::Period::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::UsageRetrieveResponse::Data::RateLimit::Period::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class SendLimit < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit,
                ArkEmail::Internal::AnyHash
              )
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
          sig do
            returns(
              ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::Period::TaggedSymbol
            )
          end
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
              period:
                ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::Period::OrSymbol,
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
                period:
                  ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::Period::TaggedSymbol,
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
                T.all(
                  Symbol,
                  ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::Period
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HOUR =
              T.let(
                :hour,
                ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::Period::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ArkEmail::Models::UsageRetrieveResponse::Data::SendLimit::Period::TaggedSymbol
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
