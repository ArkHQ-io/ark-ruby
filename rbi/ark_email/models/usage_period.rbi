# typed: strong

module ArkEmail
  module Models
    class UsagePeriod < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ArkEmail::UsagePeriod, ArkEmail::Internal::AnyHash)
        end

      # Period end (inclusive)
      sig { returns(Time) }
      attr_accessor :end_

      # Period start (inclusive)
      sig { returns(Time) }
      attr_accessor :start

      # Time period for usage data
      sig { params(end_: Time, start: Time).returns(T.attached_class) }
      def self.new(
        # Period end (inclusive)
        end_:,
        # Period start (inclusive)
        start:
      )
      end

      sig { override.returns({ end_: Time, start: Time }) }
      def to_hash
      end
    end
  end
end
