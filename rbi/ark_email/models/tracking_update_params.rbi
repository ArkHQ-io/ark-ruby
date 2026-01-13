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

      # Comma-separated list of domains to exclude from click tracking
      sig { returns(T.nilable(String)) }
      attr_reader :excluded_click_domains

      sig { params(excluded_click_domains: String).void }
      attr_writer :excluded_click_domains

      # Enable or disable SSL for tracking URLs
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ssl_enabled

      sig { params(ssl_enabled: T::Boolean).void }
      attr_writer :ssl_enabled

      # Enable or disable click tracking
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :track_clicks

      sig { params(track_clicks: T::Boolean).void }
      attr_writer :track_clicks

      # Enable or disable open tracking
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :track_opens

      sig { params(track_opens: T::Boolean).void }
      attr_writer :track_opens

      sig do
        params(
          excluded_click_domains: String,
          ssl_enabled: T::Boolean,
          track_clicks: T::Boolean,
          track_opens: T::Boolean,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Comma-separated list of domains to exclude from click tracking
        excluded_click_domains: nil,
        # Enable or disable SSL for tracking URLs
        ssl_enabled: nil,
        # Enable or disable click tracking
        track_clicks: nil,
        # Enable or disable open tracking
        track_opens: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            excluded_click_domains: String,
            ssl_enabled: T::Boolean,
            track_clicks: T::Boolean,
            track_opens: T::Boolean,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
