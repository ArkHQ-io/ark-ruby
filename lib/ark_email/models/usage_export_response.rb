# frozen_string_literal: true

module ArkEmail
  module Models
    class UsageExportResponseItem < ArkEmail::Internal::Type::BaseModel
      # @!attribute bounce_rate
      #   Bounce rate (0-1)
      #
      #   @return [Float]
      required :bounce_rate, Float

      # @!attribute bounced
      #   Emails that bounced
      #
      #   @return [Integer]
      required :bounced, Integer

      # @!attribute delivered
      #   Emails successfully delivered
      #
      #   @return [Integer]
      required :delivered, Integer

      # @!attribute delivery_rate
      #   Delivery rate (0-1)
      #
      #   @return [Float]
      required :delivery_rate, Float

      # @!attribute hard_failed
      #   Emails that hard-failed
      #
      #   @return [Integer]
      required :hard_failed, Integer

      # @!attribute held
      #   Emails currently held
      #
      #   @return [Integer]
      required :held, Integer

      # @!attribute sent
      #   Total emails sent
      #
      #   @return [Integer]
      required :sent, Integer

      # @!attribute soft_failed
      #   Emails that soft-failed
      #
      #   @return [Integer]
      required :soft_failed, Integer

      # @!attribute status
      #   Current tenant status
      #
      #   @return [Symbol, ArkEmail::Models::UsageExportResponseItem::Status]
      required :status, enum: -> { ArkEmail::Models::UsageExportResponseItem::Status }

      # @!attribute tenant_id
      #   Unique tenant identifier
      #
      #   @return [String]
      required :tenant_id, String

      # @!attribute tenant_name
      #   Tenant display name
      #
      #   @return [String]
      required :tenant_name, String

      # @!attribute external_id
      #   Your external ID for this tenant
      #
      #   @return [String, nil]
      optional :external_id, String, nil?: true

      # @!method initialize(bounce_rate:, bounced:, delivered:, delivery_rate:, hard_failed:, held:, sent:, soft_failed:, status:, tenant_id:, tenant_name:, external_id: nil)
      #   Single row in usage export (JSON format)
      #
      #   @param bounce_rate [Float] Bounce rate (0-1)
      #
      #   @param bounced [Integer] Emails that bounced
      #
      #   @param delivered [Integer] Emails successfully delivered
      #
      #   @param delivery_rate [Float] Delivery rate (0-1)
      #
      #   @param hard_failed [Integer] Emails that hard-failed
      #
      #   @param held [Integer] Emails currently held
      #
      #   @param sent [Integer] Total emails sent
      #
      #   @param soft_failed [Integer] Emails that soft-failed
      #
      #   @param status [Symbol, ArkEmail::Models::UsageExportResponseItem::Status] Current tenant status
      #
      #   @param tenant_id [String] Unique tenant identifier
      #
      #   @param tenant_name [String] Tenant display name
      #
      #   @param external_id [String, nil] Your external ID for this tenant

      # Current tenant status
      #
      # @see ArkEmail::Models::UsageExportResponseItem#status
      module Status
        extend ArkEmail::Internal::Type::Enum

        ACTIVE = :active
        SUSPENDED = :suspended
        ARCHIVED = :archived

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    # @type [ArkEmail::Internal::Type::Converter]
    UsageExportResponse = ArkEmail::Internal::Type::ArrayOf[-> { ArkEmail::Models::UsageExportResponseItem }]
  end
end
