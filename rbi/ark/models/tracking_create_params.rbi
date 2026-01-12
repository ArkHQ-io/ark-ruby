# typed: strong

module Ark
  module Models
    class TrackingCreateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Ark::TrackingCreateParams, Ark::Internal::AnyHash)
        end

      # ID of the sending domain to attach this track domain to
      sig { returns(String) }
      attr_accessor :domain_id

      # Subdomain name (e.g., 'track' for track.yourdomain.com)
      sig { returns(String) }
      attr_accessor :name

      # Enable SSL for tracking URLs (recommended)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ssl_enabled

      sig { params(ssl_enabled: T::Boolean).void }
      attr_writer :ssl_enabled

      # Enable click tracking
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :track_clicks

      sig { params(track_clicks: T::Boolean).void }
      attr_writer :track_clicks

      # Enable open tracking (tracking pixel)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :track_opens

      sig { params(track_opens: T::Boolean).void }
      attr_writer :track_opens

      sig do
        params(
          domain_id: String,
          name: String,
          ssl_enabled: T::Boolean,
          track_clicks: T::Boolean,
          track_opens: T::Boolean,
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the sending domain to attach this track domain to
        domain_id:,
        # Subdomain name (e.g., 'track' for track.yourdomain.com)
        name:,
        # Enable SSL for tracking URLs (recommended)
        ssl_enabled: nil,
        # Enable click tracking
        track_clicks: nil,
        # Enable open tracking (tracking pixel)
        track_opens: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            domain_id: String,
            name: String,
            ssl_enabled: T::Boolean,
            track_clicks: T::Boolean,
            track_opens: T::Boolean,
            request_options: Ark::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
