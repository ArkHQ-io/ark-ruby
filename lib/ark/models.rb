# frozen_string_literal: true

module Ark
  [Ark::Internal::Type::BaseModel, *Ark::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Ark::Internal::AnyHash) } }
  end

  Ark::Internal::Util.walk_namespaces(Ark::Models).each do |mod|
    case mod
    in Ark::Internal::Type::Enum | Ark::Internal::Type::Union
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

  Ark::Internal::Util.walk_namespaces(Ark::Models)
                     .lazy
                     .grep(Ark::Internal::Type::Union)
                     .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  APIMeta = Ark::Models::APIMeta

  Delivery = Ark::Models::Delivery

  DNSRecord = Ark::Models::DNSRecord

  DomainCreateParams = Ark::Models::DomainCreateParams

  DomainDeleteParams = Ark::Models::DomainDeleteParams

  DomainListParams = Ark::Models::DomainListParams

  DomainResponse = Ark::Models::DomainResponse

  DomainRetrieveParams = Ark::Models::DomainRetrieveParams

  DomainVerifyParams = Ark::Models::DomainVerifyParams

  EmailGetDeliveriesParams = Ark::Models::EmailGetDeliveriesParams

  EmailListParams = Ark::Models::EmailListParams

  EmailRetrieveParams = Ark::Models::EmailRetrieveParams

  EmailRetryParams = Ark::Models::EmailRetryParams

  EmailSendBatchParams = Ark::Models::EmailSendBatchParams

  EmailSendParams = Ark::Models::EmailSendParams

  EmailSendRawParams = Ark::Models::EmailSendRawParams

  Pagination = Ark::Models::Pagination

  SendEmail = Ark::Models::SendEmail

  SuccessResponse = Ark::Models::SuccessResponse

  SuppressionBulkCreateParams = Ark::Models::SuppressionBulkCreateParams

  SuppressionCreateParams = Ark::Models::SuppressionCreateParams

  SuppressionDeleteParams = Ark::Models::SuppressionDeleteParams

  SuppressionListParams = Ark::Models::SuppressionListParams

  SuppressionRetrieveParams = Ark::Models::SuppressionRetrieveParams

  TrackDomain = Ark::Models::TrackDomain

  TrackDomainResponse = Ark::Models::TrackDomainResponse

  TrackingCreateParams = Ark::Models::TrackingCreateParams

  TrackingDeleteParams = Ark::Models::TrackingDeleteParams

  TrackingListParams = Ark::Models::TrackingListParams

  TrackingRetrieveParams = Ark::Models::TrackingRetrieveParams

  TrackingUpdateParams = Ark::Models::TrackingUpdateParams

  TrackingVerifyParams = Ark::Models::TrackingVerifyParams

  WebhookCreateParams = Ark::Models::WebhookCreateParams

  WebhookDeleteParams = Ark::Models::WebhookDeleteParams

  WebhookListParams = Ark::Models::WebhookListParams

  WebhookResponse = Ark::Models::WebhookResponse

  WebhookRetrieveParams = Ark::Models::WebhookRetrieveParams

  WebhookTestParams = Ark::Models::WebhookTestParams

  WebhookUpdateParams = Ark::Models::WebhookUpdateParams
end
