# typed: strong

module Ark
  module Models
    class EmailRetrieveParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(Ark::EmailRetrieveParams, Ark::Internal::AnyHash) }

      # Comma-separated list of fields to include:
      #
      # - `content` - HTML and plain text body
      # - `headers` - Email headers
      # - `deliveries` - Delivery attempt history
      # - `activity` - Opens and clicks
      sig { returns(T.nilable(String)) }
      attr_reader :expand

      sig { params(expand: String).void }
      attr_writer :expand

      sig do
        params(
          expand: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Comma-separated list of fields to include:
        #
        # - `content` - HTML and plain text body
        # - `headers` - Email headers
        # - `deliveries` - Delivery attempt history
        # - `activity` - Opens and clicks
        expand: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { expand: String, request_options: Ark::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
