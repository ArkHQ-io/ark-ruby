# typed: strong

module ArkEmail
  module Models
    class EmailRetrieveParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::EmailRetrieveParams, ArkEmail::Internal::AnyHash)
        end

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
          request_options: ArkEmail::RequestOptions::OrHash
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
          { expand: String, request_options: ArkEmail::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
