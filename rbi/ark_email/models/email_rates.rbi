# typed: strong

module ArkEmail
  module Models
    class EmailRates < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailRates, ArkEmail::Internal::AnyHash)
        end

      # Percentage of sent emails that bounced (0-1)
      sig { returns(Float) }
      attr_accessor :bounce_rate

      # Percentage of sent emails that were delivered (0-1)
      sig { returns(Float) }
      attr_accessor :delivery_rate

      # Email delivery rates (as decimals, e.g., 0.95 = 95%)
      sig do
        params(bounce_rate: Float, delivery_rate: Float).returns(
          T.attached_class
        )
      end
      def self.new(
        # Percentage of sent emails that bounced (0-1)
        bounce_rate:,
        # Percentage of sent emails that were delivered (0-1)
        delivery_rate:
      )
      end

      sig { override.returns({ bounce_rate: Float, delivery_rate: Float }) }
      def to_hash
      end
    end
  end
end
