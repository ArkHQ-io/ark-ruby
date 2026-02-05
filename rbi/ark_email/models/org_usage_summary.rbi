# typed: strong

module ArkEmail
  module Models
    class OrgUsageSummary < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::OrgUsageSummary, ArkEmail::Internal::AnyHash)
        end

      sig { returns(ArkEmail::OrgUsageSummary::Data) }
      attr_reader :data

      sig { params(data: ArkEmail::OrgUsageSummary::Data::OrHash).void }
      attr_writer :data

      sig { returns(ArkEmail::APIMeta) }
      attr_reader :meta

      sig { params(meta: ArkEmail::APIMeta::OrHash).void }
      attr_writer :meta

      sig { returns(T::Boolean) }
      attr_accessor :success

      # Org-wide usage summary response
      sig do
        params(
          data: ArkEmail::OrgUsageSummary::Data::OrHash,
          meta: ArkEmail::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(data:, meta:, success: true)
      end

      sig do
        override.returns(
          {
            data: ArkEmail::OrgUsageSummary::Data,
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
            T.any(ArkEmail::OrgUsageSummary::Data, ArkEmail::Internal::AnyHash)
          end

        # Email delivery counts
        sig { returns(ArkEmail::EmailCounts) }
        attr_reader :emails

        sig { params(emails: ArkEmail::EmailCounts::OrHash).void }
        attr_writer :emails

        # Time period for usage data
        sig { returns(ArkEmail::UsagePeriod) }
        attr_reader :period

        sig { params(period: ArkEmail::UsagePeriod::OrHash).void }
        attr_writer :period

        # Email delivery rates (as decimals, e.g., 0.95 = 95%)
        sig { returns(ArkEmail::EmailRates) }
        attr_reader :rates

        sig { params(rates: ArkEmail::EmailRates::OrHash).void }
        attr_writer :rates

        sig { returns(ArkEmail::OrgUsageSummary::Data::Tenants) }
        attr_reader :tenants

        sig do
          params(tenants: ArkEmail::OrgUsageSummary::Data::Tenants::OrHash).void
        end
        attr_writer :tenants

        sig do
          params(
            emails: ArkEmail::EmailCounts::OrHash,
            period: ArkEmail::UsagePeriod::OrHash,
            rates: ArkEmail::EmailRates::OrHash,
            tenants: ArkEmail::OrgUsageSummary::Data::Tenants::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Email delivery counts
          emails:,
          # Time period for usage data
          period:,
          # Email delivery rates (as decimals, e.g., 0.95 = 95%)
          rates:,
          tenants:
        )
        end

        sig do
          override.returns(
            {
              emails: ArkEmail::EmailCounts,
              period: ArkEmail::UsagePeriod,
              rates: ArkEmail::EmailRates,
              tenants: ArkEmail::OrgUsageSummary::Data::Tenants
            }
          )
        end
        def to_hash
        end

        class Tenants < ArkEmail::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ArkEmail::OrgUsageSummary::Data::Tenants,
                ArkEmail::Internal::AnyHash
              )
            end

          # Number of active tenants
          sig { returns(Integer) }
          attr_accessor :active

          # Total number of tenants
          sig { returns(Integer) }
          attr_accessor :total

          # Number of tenants with sending activity
          sig { returns(Integer) }
          attr_accessor :with_activity

          sig do
            params(
              active: Integer,
              total: Integer,
              with_activity: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of active tenants
            active:,
            # Total number of tenants
            total:,
            # Number of tenants with sending activity
            with_activity:
          )
          end

          sig do
            override.returns(
              { active: Integer, total: Integer, with_activity: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
