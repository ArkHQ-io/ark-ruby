# typed: strong

module ArkEmail
  module Resources
    class Tenants
      class Suppressions
        # Add an email address to the tenant's suppression list. The address will not
        # receive any emails from this tenant until removed.
        sig do
          params(
            tenant_id: String,
            address: String,
            reason: T.nilable(String),
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::SuppressionCreateResponse)
        end
        def create(
          # The tenant ID
          tenant_id,
          # Email address to suppress
          address:,
          # Reason for suppression (accepts null)
          reason: nil,
          request_options: {}
        )
        end

        # Check if a specific email address is on the tenant's suppression list.
        sig do
          params(
            email: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::SuppressionRetrieveResponse)
        end
        def retrieve(
          # Email address (URL-encoded)
          email,
          # The tenant ID
          tenant_id:,
          request_options: {}
        )
        end

        # Get all email addresses on the tenant's suppression list. These addresses will
        # not receive any emails from this tenant.
        sig do
          params(
            tenant_id: String,
            page: Integer,
            per_page: Integer,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(
            ArkEmail::Internal::PageNumberPagination[
              ArkEmail::Models::Tenants::SuppressionListResponse
            ]
          )
        end
        def list(
          # The tenant ID
          tenant_id,
          page: nil,
          per_page: nil,
          request_options: {}
        )
        end

        # Remove an email address from the tenant's suppression list. The address will be
        # able to receive emails from this tenant again.
        sig do
          params(
            email: String,
            tenant_id: String,
            request_options: ArkEmail::RequestOptions::OrHash
          ).returns(ArkEmail::Models::Tenants::SuppressionDeleteResponse)
        end
        def delete(
          # Email address (URL-encoded)
          email,
          # The tenant ID
          tenant_id:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ArkEmail::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
