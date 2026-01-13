# typed: strong

module Ark
  module Resources
    class Suppressions
      # Add an email address to the suppression list. The address will not receive any
      # emails until removed.
      sig do
        params(
          address: String,
          reason: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::SuppressionCreateResponse)
      end
      def create(
        # Email address to suppress
        address:,
        # Reason for suppression
        reason: nil,
        request_options: {}
      )
      end

      # Check if a specific email address is on the suppression list
      sig do
        params(
          email: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::SuppressionRetrieveResponse)
      end
      def retrieve(
        # Email address (URL-encoded)
        email,
        request_options: {}
      )
      end

      # Get all email addresses on the suppression list. These addresses will not
      # receive any emails.
      sig do
        params(
          page: Integer,
          per_page: Integer,
          request_options: Ark::RequestOptions::OrHash
        ).returns(
          Ark::Internal::PageNumberPagination[
            Ark::Models::SuppressionListResponse
          ]
        )
      end
      def list(page: nil, per_page: nil, request_options: {})
      end

      # Remove an email address from the suppression list. The address will be able to
      # receive emails again.
      sig do
        params(
          email: String,
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::SuppressionDeleteResponse)
      end
      def delete(email, request_options: {})
      end

      # Add up to 1000 email addresses to the suppression list at once
      sig do
        params(
          suppressions:
            T::Array[Ark::SuppressionBulkCreateParams::Suppression::OrHash],
          request_options: Ark::RequestOptions::OrHash
        ).returns(Ark::Models::SuppressionBulkCreateResponse)
      end
      def bulk_create(suppressions:, request_options: {})
      end

      # @api private
      sig { params(client: Ark::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
