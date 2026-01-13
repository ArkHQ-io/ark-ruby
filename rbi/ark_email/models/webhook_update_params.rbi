# typed: strong

module ArkEmail
  module Models
    class WebhookUpdateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::WebhookUpdateParams, ArkEmail::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :all_events

      sig { params(all_events: T::Boolean).void }
      attr_writer :all_events

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :events

      sig { params(events: T::Array[String]).void }
      attr_writer :events

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig do
        params(
          all_events: T::Boolean,
          enabled: T::Boolean,
          events: T::Array[String],
          name: String,
          url: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        all_events: nil,
        enabled: nil,
        events: nil,
        name: nil,
        url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            all_events: T::Boolean,
            enabled: T::Boolean,
            events: T::Array[String],
            name: String,
            url: String,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
