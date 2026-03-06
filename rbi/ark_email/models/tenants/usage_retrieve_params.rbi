# typed: strong

module ArkEmail
  module Models
    module Tenants
      class UsageRetrieveParams < ArkEmail::Internal::Type::BaseModel
        extend ArkEmail::Internal::Type::RequestParameters::Converter
        include ArkEmail::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Tenants::UsageRetrieveParams,
              ArkEmail::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tenant_id

        # Time period for usage data. Defaults to current month.
        #
        # **Formats:**
        #
        # - Shortcuts: `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
        #   `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
        # - Month: `2024-01`
        # - Range: `2024-01-01..2024-01-31`
        # - Day: `2024-01-15`
        sig { returns(T.nilable(String)) }
        attr_reader :period

        sig { params(period: String).void }
        attr_writer :period

        # Timezone for period calculations (IANA format). Defaults to UTC.
        sig { returns(T.nilable(String)) }
        attr_reader :timezone

        sig { params(timezone: String).void }
        attr_writer :timezone

        sig do
          params(
            tenant_id: String,
            period: String,
            timezone: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tenant_id:,
          # Time period for usage data. Defaults to current month.
          #
          # **Formats:**
          #
          # - Shortcuts: `today`, `yesterday`, `this_week`, `last_week`, `this_month`,
          #   `last_month`, `last_7_days`, `last_30_days`, `last_90_days`
          # - Month: `2024-01`
          # - Range: `2024-01-01..2024-01-31`
          # - Day: `2024-01-15`
          period: nil,
          # Timezone for period calculations (IANA format). Defaults to UTC.
          timezone: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tenant_id: String,
              period: String,
              timezone: String,
              request_options: ArkEmail::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
