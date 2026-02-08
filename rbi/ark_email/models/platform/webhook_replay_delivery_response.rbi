# typed: strong

module ArkEmail
  module Models
    module Platform
      class WebhookReplayDeliveryResponse < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::Models::Platform::WebhookReplayDeliveryResponse,
              ArkEmail::Internal::AnyHash
            )
          end

        sig do
          returns(
            ArkEmail::Models::Platform::WebhookReplayDeliveryResponse::Data
          )
        end
        attr_reader :data

        sig do
          params(
            data:
              ArkEmail::Models::Platform::WebhookReplayDeliveryResponse::Data::OrHash
          ).void
        end
        attr_writer :data

        sig { returns(ArkEmail::APIMeta) }
        attr_reader :meta

        sig { params(meta: ArkEmail::APIMeta::OrHash).void }
        attr_writer :meta

        sig { returns(T::Boolean) }
        attr_accessor :success

        # Result of replaying a platform webhook delivery
        sig do
          params(
            data:
              ArkEmail::Models::Platform::WebhookReplayDeliveryResponse::Data::OrHash,
            meta: ArkEmail::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(data:, meta:, success: true)
        end

        sig do
          override.returns(
            {
              data:
                ArkEmail::Models::Platform::WebhookReplayDeliveryResponse::Data,
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
              T.any(
                ArkEmail::Models::Platform::WebhookReplayDeliveryResponse::Data,
                ArkEmail::Internal::AnyHash
              )
            end

          # Request duration in milliseconds
          sig { returns(Integer) }
          attr_accessor :duration

          # ID of the new delivery created by the replay
          sig { returns(String) }
          attr_accessor :new_delivery_id

          # ID of the original delivery that was replayed
          sig { returns(String) }
          attr_accessor :original_delivery_id

          # HTTP status code from your endpoint
          sig { returns(T.nilable(Integer)) }
          attr_accessor :status_code

          # Whether the replay was successful
          sig { returns(T::Boolean) }
          attr_accessor :success

          # When the replay was executed
          sig { returns(Time) }
          attr_accessor :timestamp

          sig do
            params(
              duration: Integer,
              new_delivery_id: String,
              original_delivery_id: String,
              status_code: T.nilable(Integer),
              success: T::Boolean,
              timestamp: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # Request duration in milliseconds
            duration:,
            # ID of the new delivery created by the replay
            new_delivery_id:,
            # ID of the original delivery that was replayed
            original_delivery_id:,
            # HTTP status code from your endpoint
            status_code:,
            # Whether the replay was successful
            success:,
            # When the replay was executed
            timestamp:
          )
          end

          sig do
            override.returns(
              {
                duration: Integer,
                new_delivery_id: String,
                original_delivery_id: String,
                status_code: T.nilable(Integer),
                success: T::Boolean,
                timestamp: Time
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
