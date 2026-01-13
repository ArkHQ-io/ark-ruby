# typed: strong

module ArkEmail
  module Models
    class TrackingCreateParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::TrackingCreateParams, ArkEmail::Internal::AnyHash)
        end

      # ID of the sending domain to attach this track domain to
      sig { returns(Integer) }
      attr_accessor :domain_id

      # Subdomain name (e.g., 'track' for track.yourdomain.com)
      sig { returns(String) }
      attr_accessor :name

      # Enable SSL for tracking URLs (accepts null, defaults to true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :ssl_enabled

      # Enable click tracking (accepts null, defaults to true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :track_clicks

      # Enable open tracking (tracking pixel, accepts null, defaults to true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :track_opens

      sig do
        params(
          domain_id: Integer,
          name: String,
          ssl_enabled: T.nilable(T::Boolean),
          track_clicks: T.nilable(T::Boolean),
          track_opens: T.nilable(T::Boolean),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the sending domain to attach this track domain to
        domain_id:,
        # Subdomain name (e.g., 'track' for track.yourdomain.com)
        name:,
        # Enable SSL for tracking URLs (accepts null, defaults to true)
        ssl_enabled: nil,
        # Enable click tracking (accepts null, defaults to true)
        track_clicks: nil,
        # Enable open tracking (tracking pixel, accepts null, defaults to true)
        track_opens: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            domain_id: Integer,
            name: String,
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
