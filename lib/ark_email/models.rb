# frozen_string_literal: true

module ArkEmail
  [ArkEmail::Internal::Type::BaseModel, *ArkEmail::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, ArkEmail::Internal::AnyHash) } }
  end

  ArkEmail::Internal::Util.walk_namespaces(ArkEmail::Models).each do |mod|
    case mod
    in ArkEmail::Internal::Type::Enum | ArkEmail::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  ArkEmail::Internal::Util.walk_namespaces(ArkEmail::Models)
                          .lazy
                          .grep(ArkEmail::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  APIMeta = ArkEmail::Models::APIMeta

  BulkTenantUsage = ArkEmail::Models::BulkTenantUsage

  DNSRecord = ArkEmail::Models::DNSRecord

  DomainCreateParams = ArkEmail::Models::DomainCreateParams

  DomainDeleteParams = ArkEmail::Models::DomainDeleteParams

  DomainListParams = ArkEmail::Models::DomainListParams

  DomainRetrieveParams = ArkEmail::Models::DomainRetrieveParams

  DomainVerifyParams = ArkEmail::Models::DomainVerifyParams

  EmailCounts = ArkEmail::Models::EmailCounts

  EmailListParams = ArkEmail::Models::EmailListParams

  EmailRates = ArkEmail::Models::EmailRates

  EmailRetrieveDeliveriesParams = ArkEmail::Models::EmailRetrieveDeliveriesParams

  EmailRetrieveParams = ArkEmail::Models::EmailRetrieveParams

  EmailRetryParams = ArkEmail::Models::EmailRetryParams

  EmailSendBatchParams = ArkEmail::Models::EmailSendBatchParams

  EmailSendParams = ArkEmail::Models::EmailSendParams

  EmailSendRawParams = ArkEmail::Models::EmailSendRawParams

  LimitRetrieveParams = ArkEmail::Models::LimitRetrieveParams

  LimitsData = ArkEmail::Models::LimitsData

  LogEntry = ArkEmail::Models::LogEntry

  LogEntryDetail = ArkEmail::Models::LogEntryDetail

  LogListParams = ArkEmail::Models::LogListParams

  LogRetrieveParams = ArkEmail::Models::LogRetrieveParams

  SuppressionBulkCreateParams = ArkEmail::Models::SuppressionBulkCreateParams

  SuppressionCreateParams = ArkEmail::Models::SuppressionCreateParams

  SuppressionDeleteParams = ArkEmail::Models::SuppressionDeleteParams

  SuppressionListParams = ArkEmail::Models::SuppressionListParams

  SuppressionRetrieveParams = ArkEmail::Models::SuppressionRetrieveParams

  Tenant = ArkEmail::Models::Tenant

  TenantCreateParams = ArkEmail::Models::TenantCreateParams

  TenantDeleteParams = ArkEmail::Models::TenantDeleteParams

  TenantListParams = ArkEmail::Models::TenantListParams

  TenantRetrieveParams = ArkEmail::Models::TenantRetrieveParams

  Tenants = ArkEmail::Models::Tenants

  TenantUpdateParams = ArkEmail::Models::TenantUpdateParams

  TenantUsage = ArkEmail::Models::TenantUsage

  TenantUsageTimeseries = ArkEmail::Models::TenantUsageTimeseries

  TrackDomain = ArkEmail::Models::TrackDomain

  TrackingCreateParams = ArkEmail::Models::TrackingCreateParams

  TrackingDeleteParams = ArkEmail::Models::TrackingDeleteParams

  TrackingListParams = ArkEmail::Models::TrackingListParams

  TrackingRetrieveParams = ArkEmail::Models::TrackingRetrieveParams

  TrackingUpdateParams = ArkEmail::Models::TrackingUpdateParams

  TrackingVerifyParams = ArkEmail::Models::TrackingVerifyParams

  UsageExportParams = ArkEmail::Models::UsageExportParams

  UsageListByTenantParams = ArkEmail::Models::UsageListByTenantParams

  UsagePeriod = ArkEmail::Models::UsagePeriod

  UsageRetrieveParams = ArkEmail::Models::UsageRetrieveParams

  UsageRetrieveTenantTimeseriesParams = ArkEmail::Models::UsageRetrieveTenantTimeseriesParams

  UsageRetrieveTenantUsageParams = ArkEmail::Models::UsageRetrieveTenantUsageParams

  WebhookCreateParams = ArkEmail::Models::WebhookCreateParams

  WebhookDeleteParams = ArkEmail::Models::WebhookDeleteParams

  WebhookListDeliveriesParams = ArkEmail::Models::WebhookListDeliveriesParams

  WebhookListParams = ArkEmail::Models::WebhookListParams

  WebhookReplayDeliveryParams = ArkEmail::Models::WebhookReplayDeliveryParams

  WebhookRetrieveDeliveryParams = ArkEmail::Models::WebhookRetrieveDeliveryParams

  WebhookRetrieveParams = ArkEmail::Models::WebhookRetrieveParams

  WebhookTestParams = ArkEmail::Models::WebhookTestParams

  WebhookUpdateParams = ArkEmail::Models::WebhookUpdateParams
end
