# typed: strong

module ArkEmail
  module Models
    class UsageExportResponseItem < ArkEmail::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ArkEmail::Models::UsageExportResponseItem,
            ArkEmail::Internal::AnyHash
          )
        end

      # Bounce rate (0-1)
      sig { returns(Float) }
      attr_accessor :bounce_rate

      # Emails that bounced
      sig { returns(Integer) }
      attr_accessor :bounced

      # Emails successfully delivered
      sig { returns(Integer) }
      attr_accessor :delivered

      # Delivery rate (0-1)
      sig { returns(Float) }
      attr_accessor :delivery_rate

      # Emails that hard-failed
      sig { returns(Integer) }
      attr_accessor :hard_failed

      # Emails currently held
      sig { returns(Integer) }
      attr_accessor :held

      # Total emails sent
      sig { returns(Integer) }
      attr_accessor :sent

      # Emails that soft-failed
      sig { returns(Integer) }
      attr_accessor :soft_failed

      # Current tenant status
      sig do
        returns(ArkEmail::Models::UsageExportResponseItem::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Unique tenant identifier
      sig { returns(String) }
      attr_accessor :tenant_id

      # Tenant display name
      sig { returns(String) }
      attr_accessor :tenant_name

      # Your external ID for this tenant
      sig { returns(T.nilable(String)) }
      attr_accessor :external_id

      # Single row in usage export (JSON format)
      sig do
        params(
          bounce_rate: Float,
          bounced: Integer,
          delivered: Integer,
          delivery_rate: Float,
          hard_failed: Integer,
          held: Integer,
          sent: Integer,
          soft_failed: Integer,
          status: ArkEmail::Models::UsageExportResponseItem::Status::OrSymbol,
          tenant_id: String,
          tenant_name: String,
          external_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Bounce rate (0-1)
        bounce_rate:,
        # Emails that bounced
        bounced:,
        # Emails successfully delivered
        delivered:,
        # Delivery rate (0-1)
        delivery_rate:,
        # Emails that hard-failed
        hard_failed:,
        # Emails currently held
        held:,
        # Total emails sent
        sent:,
        # Emails that soft-failed
        soft_failed:,
        # Current tenant status
        status:,
        # Unique tenant identifier
        tenant_id:,
        # Tenant display name
        tenant_name:,
        # Your external ID for this tenant
        external_id: nil
      )
      end

      sig do
        override.returns(
          {
            bounce_rate: Float,
            bounced: Integer,
            delivered: Integer,
            delivery_rate: Float,
            hard_failed: Integer,
            held: Integer,
            sent: Integer,
            soft_failed: Integer,
            status:
              ArkEmail::Models::UsageExportResponseItem::Status::TaggedSymbol,
            tenant_id: String,
            tenant_name: String,
            external_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Current tenant status
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ArkEmail::Models::UsageExportResponseItem::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            ArkEmail::Models::UsageExportResponseItem::Status::TaggedSymbol
          )
        SUSPENDED =
          T.let(
            :suspended,
            ArkEmail::Models::UsageExportResponseItem::Status::TaggedSymbol
          )
        ARCHIVED =
          T.let(
            :archived,
            ArkEmail::Models::UsageExportResponseItem::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ArkEmail::Models::UsageExportResponseItem::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end

    UsageExportResponse =
      T.let(
        ArkEmail::Internal::Type::ArrayOf[
          ArkEmail::Models::UsageExportResponseItem
        ],
        ArkEmail::Internal::Type::Converter
      )
  end
end
