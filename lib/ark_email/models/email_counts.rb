# frozen_string_literal: true

module ArkEmail
  module Models
    class EmailCounts < ArkEmail::Internal::Type::BaseModel
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

      # @!attribute hard_failed
      #   Emails that hard-failed (permanent failures)
      #
      #   @return [Integer]
      required :hard_failed, Integer

      # @!attribute held
      #   Emails currently held for review
      #
      #   @return [Integer]
      required :held, Integer

      # @!attribute sent
      #   Total emails sent
      #
      #   @return [Integer]
      required :sent, Integer

      # @!attribute soft_failed
      #   Emails that soft-failed (temporary failures, may be retried)
      #
      #   @return [Integer]
      required :soft_failed, Integer

      # @!method initialize(bounced:, delivered:, hard_failed:, held:, sent:, soft_failed:)
      #   Email delivery counts
      #
      #   @param bounced [Integer] Emails that bounced
      #
      #   @param delivered [Integer] Emails successfully delivered
      #
      #   @param hard_failed [Integer] Emails that hard-failed (permanent failures)
      #
      #   @param held [Integer] Emails currently held for review
      #
      #   @param sent [Integer] Total emails sent
      #
      #   @param soft_failed [Integer] Emails that soft-failed (temporary failures, may be retried)
    end
  end
end
