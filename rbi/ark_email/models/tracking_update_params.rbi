# typed: strong

module ArkEmail
  module Models
    class TrackingUpdateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::TrackingUpdateParams, ArkEmail::Internal::AnyHash)
        end

      # Comma-separated list of domains to exclude from click tracking (accepts null)
      sig { returns(T.nilable(String)) }
      attr_accessor :excluded_click_domains

      # Enable or disable SSL for tracking URLs (accepts null)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :ssl_enabled

      # Enable or disable click tracking (accepts null)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :track_clicks

      # Enable or disable open tracking (accepts null)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :track_opens

      sig do
        params(
          excluded_click_domains: T.nilable(String),
          ssl_enabled: T.nilable(T::Boolean),
          track_clicks: T.nilable(T::Boolean),
          track_opens: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Comma-separated list of domains to exclude from click tracking (accepts null)
        excluded_click_domains: nil,
        # Enable or disable SSL for tracking URLs (accepts null)
        ssl_enabled: nil,
        # Enable or disable click tracking (accepts null)
        track_clicks: nil,
        # Enable or disable open tracking (accepts null)
        track_opens: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            excluded_click_domains: T.nilable(String),
            ssl_enabled: T.nilable(T::Boolean),
            track_clicks: T.nilable(T::Boolean),
            track_opens: T.nilable(T::Boolean),
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
