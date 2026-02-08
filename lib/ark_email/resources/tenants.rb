# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      # @return [ArkEmail::Resources::Tenants::Credentials]
      attr_reader :credentials

      # @return [ArkEmail::Resources::Tenants::Domains]
      attr_reader :domains

      # @return [ArkEmail::Resources::Tenants::Suppressions]
      attr_reader :suppressions

      # @return [ArkEmail::Resources::Tenants::Webhooks]
      attr_reader :webhooks

      # @return [ArkEmail::Resources::Tenants::Tracking]
      attr_reader :tracking

      # @return [ArkEmail::Resources::Tenants::Usage]
      attr_reader :usage

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::TenantCreateParams} for more details.
      #
      # Create a new tenant.
      #
      # Returns the created tenant with a unique `id`. Store this ID in your database to
      # reference this tenant later.
      #
      # @overload create(name:, metadata: nil, request_options: {})
      #
      # @param name [String] Display name for the tenant (e.g., your customer's company name)
      #
      # @param metadata [Hash{Symbol=>String, Float, Boolean, nil}, nil] Custom key-value pairs. Useful for storing references to your internal systems.
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantCreateResponse]
      #
      # @see ArkEmail::Models::TenantCreateParams
      def create(params)
        parsed, options = ArkEmail::TenantCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "tenants",
          body: parsed,
          model: ArkEmail::Models::TenantCreateResponse,
          options: options
        )
      end

      # Get a tenant by ID.
      #
      # @overload retrieve(tenant_id, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantRetrieveResponse]
      #
      # @see ArkEmail::Models::TenantRetrieveParams
      def retrieve(tenant_id, params = {})
        @client.request(
          method: :get,
          path: ["tenants/%1$s", tenant_id],
          model: ArkEmail::Models::TenantRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ArkEmail::Models::TenantUpdateParams} for more details.
      #
      # Update a tenant's name, metadata, or status. At least one field is required.
      #
      # Metadata is replaced entirely—include all keys you want to keep.
      #
      # @overload update(tenant_id, metadata: nil, name: nil, status: nil, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param metadata [Hash{Symbol=>String, Float, Boolean, nil}, nil] Custom key-value pairs. Useful for storing references to your internal systems.
      #
      # @param name [String] Display name for the tenant
      #
      # @param status [Symbol, ArkEmail::Models::TenantUpdateParams::Status] Tenant status
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantUpdateResponse]
      #
      # @see ArkEmail::Models::TenantUpdateParams
      def update(tenant_id, params = {})
        parsed, options = ArkEmail::TenantUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["tenants/%1$s", tenant_id],
          body: parsed,
          model: ArkEmail::Models::TenantUpdateResponse,
          options: options
        )
      end

      # List all tenants with pagination. Filter by `status` if needed.
      #
      # @overload list(page: nil, per_page: nil, status: nil, request_options: {})
      #
      # @param page [Integer] Page number (1-indexed)
      #
      # @param per_page [Integer] Number of items per page (max 100)
      #
      # @param status [Symbol, ArkEmail::Models::TenantListParams::Status] Filter by tenant status
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::Tenant>]
      #
      # @see ArkEmail::Models::TenantListParams
      def list(params = {})
        parsed, options = ArkEmail::TenantListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "tenants",
          query: parsed.transform_keys(per_page: "perPage"),
          page: ArkEmail::Internal::PageNumberPagination,
          model: ArkEmail::Tenant,
          options: options
        )
      end

      # Permanently delete a tenant. This cannot be undone.
      #
      # @overload delete(tenant_id, request_options: {})
      #
      # @param tenant_id [String] The tenant ID
      #
      # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ArkEmail::Models::TenantDeleteResponse]
      #
      # @see ArkEmail::Models::TenantDeleteParams
      def delete(tenant_id, params = {})
        @client.request(
          method: :delete,
          path: ["tenants/%1$s", tenant_id],
          model: ArkEmail::Models::TenantDeleteResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [ArkEmail::Client]
      def initialize(client:)
        @client = client
        @credentials = ArkEmail::Resources::Tenants::Credentials.new(client: client)
        @domains = ArkEmail::Resources::Tenants::Domains.new(client: client)
        @suppressions = ArkEmail::Resources::Tenants::Suppressions.new(client: client)
        @webhooks = ArkEmail::Resources::Tenants::Webhooks.new(client: client)
        @tracking = ArkEmail::Resources::Tenants::Tracking.new(client: client)
        @usage = ArkEmail::Resources::Tenants::Usage.new(client: client)
      end
    end
  end
end
