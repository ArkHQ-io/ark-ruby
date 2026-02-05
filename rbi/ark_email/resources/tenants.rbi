# typed: strong

module ArkEmail
  module Resources
    class Tenants
      sig { returns(ArkEmail::Resources::Tenants::Credentials) }
      attr_reader :credentials

      sig { returns(ArkEmail::Resources::Tenants::Domains) }
      attr_reader :domains

      sig { returns(ArkEmail::Resources::Tenants::Suppressions) }
      attr_reader :suppressions

      sig { returns(ArkEmail::Resources::Tenants::Webhooks) }
      attr_reader :webhooks

      sig { returns(ArkEmail::Resources::Tenants::Tracking) }
      attr_reader :tracking

      sig { returns(ArkEmail::Resources::Tenants::Usage) }
      attr_reader :usage

      # Create a new tenant.
      #
      # Returns the created tenant with a unique `id`. Store this ID in your database to
      # reference this tenant later.
      sig do
        params(
          name: String,
          metadata:
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(ArkEmail::TenantCreateParams::Metadata::Variants)
              ]
            ),
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantCreateResponse)
      end
      def create(
        # Display name for the tenant (e.g., your customer's company name)
        name:,
        # Custom key-value pairs. Useful for storing references to your internal systems.
        #
        # **Limits:**
        #
        # - Max 50 keys
        # - Key names max 40 characters
        # - String values max 500 characters
        # - Total size max 8KB
        metadata: nil,
        request_options: {}
      )
      end

      # Get a tenant by ID.
      sig do
        params(
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantRetrieveResponse)
      end
      def retrieve(
        # The tenant ID
        tenant_id,
        request_options: {}
      )
      end

      # Update a tenant's name, metadata, or status. At least one field is required.
      #
      # Metadata is replaced entirely—include all keys you want to keep.
      sig do
        params(
          tenant_id: String,
          metadata:
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(ArkEmail::TenantUpdateParams::Metadata::Variants)
              ]
            ),
          name: String,
          status: ArkEmail::TenantUpdateParams::Status::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantUpdateResponse)
      end
      def update(
        # The tenant ID
        tenant_id,
        # Custom key-value pairs. Useful for storing references to your internal systems.
        #
        # **Limits:**
        #
        # - Max 50 keys
        # - Key names max 40 characters
        # - String values max 500 characters
        # - Total size max 8KB
        metadata: nil,
        # Display name for the tenant
        name: nil,
        # Tenant status
        status: nil,
        request_options: {}
      )
      end

      # List all tenants with pagination. Filter by `status` if needed.
      sig do
        params(
          page: Integer,
          per_page: Integer,
          status: ArkEmail::TenantListParams::Status::OrSymbol,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Internal::PageNumberPagination[ArkEmail::Tenant])
      end
      def list(
        # Page number (1-indexed)
        page: nil,
        # Number of items per page (max 100)
        per_page: nil,
        # Filter by tenant status
        status: nil,
        request_options: {}
      )
      end

      # Permanently delete a tenant. This cannot be undone.
      sig do
        params(
          tenant_id: String,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(ArkEmail::Models::TenantDeleteResponse)
      end
      def delete(
        # The tenant ID
        tenant_id,
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
