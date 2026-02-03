# typed: strong

module ArkEmail
  module Models
    class EmailCounts < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailCounts, ArkEmail::Internal::AnyHash)
        end

      # Emails that bounced
      sig { returns(Integer) }
      attr_accessor :bounced

      # Emails successfully delivered
      sig { returns(Integer) }
      attr_accessor :delivered

      # Emails that hard-failed (permanent failures)
      sig { returns(Integer) }
      attr_accessor :hard_failed

      # Emails currently held for review
      sig { returns(Integer) }
      attr_accessor :held

      # Total emails sent
      sig { returns(Integer) }
      attr_accessor :sent

      # Emails that soft-failed (temporary failures, may be retried)
      sig { returns(Integer) }
      attr_accessor :soft_failed

      # Email delivery counts
      sig do
        params(
          bounced: Integer,
          delivered: Integer,
          hard_failed: Integer,
          held: Integer,
          sent: Integer,
          soft_failed: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Emails that bounced
        bounced:,
        # Emails successfully delivered
        delivered:,
        # Emails that hard-failed (permanent failures)
        hard_failed:,
        # Emails currently held for review
        held:,
        # Total emails sent
        sent:,
        # Emails that soft-failed (temporary failures, may be retried)
        soft_failed:
      )
      end

      sig do
        override.returns(
          {
            bounced: Integer,
            delivered: Integer,
            hard_failed: Integer,
            held: Integer,
            sent: Integer,
            soft_failed: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
