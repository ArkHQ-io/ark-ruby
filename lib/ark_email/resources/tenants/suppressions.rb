# frozen_string_literal: true

module ArkEmail
  module Resources
    class Tenants
      class Suppressions
        # Add an email address to the tenant's suppression list. The address will not
        # receive any emails from this tenant until removed.
        #
        # @overload create(tenant_id, address:, reason: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param address [String] Email address to suppress
        #
        # @param reason [String, nil] Reason for suppression (accepts null)
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::SuppressionCreateResponse]
        #
        # @see ArkEmail::Models::Tenants::SuppressionCreateParams
        def create(tenant_id, params)
          parsed, options = ArkEmail::Tenants::SuppressionCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["tenants/%1$s/suppressions", tenant_id],
            body: parsed,
            model: ArkEmail::Models::Tenants::SuppressionCreateResponse,
            options: options
          )
        end

        # Check if a specific email address is on the tenant's suppression list.
        #
        # @overload retrieve(email, tenant_id:, request_options: {})
        #
        # @param email [String] Email address (URL-encoded)
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::SuppressionRetrieveResponse]
        #
        # @see ArkEmail::Models::Tenants::SuppressionRetrieveParams
        def retrieve(email, params)
          parsed, options = ArkEmail::Tenants::SuppressionRetrieveParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/suppressions/%2$s", tenant_id, email],
            model: ArkEmail::Models::Tenants::SuppressionRetrieveResponse,
            options: options
          )
        end

        # Get all email addresses on the tenant's suppression list. These addresses will
        # not receive any emails from this tenant.
        #
        # @overload list(tenant_id, page: nil, per_page: nil, request_options: {})
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param page [Integer]
        #
        # @param per_page [Integer]
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Internal::PageNumberPagination<ArkEmail::Models::Tenants::SuppressionListResponse>]
        #
        # @see ArkEmail::Models::Tenants::SuppressionListParams
        def list(tenant_id, params = {})
          parsed, options = ArkEmail::Tenants::SuppressionListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["tenants/%1$s/suppressions", tenant_id],
            query: parsed.transform_keys(per_page: "perPage"),
            page: ArkEmail::Internal::PageNumberPagination,
            model: ArkEmail::Models::Tenants::SuppressionListResponse,
            options: options
          )
        end

        # Remove an email address from the tenant's suppression list. The address will be
        # able to receive emails from this tenant again.
        #
        # @overload delete(email, tenant_id:, request_options: {})
        #
        # @param email [String] Email address (URL-encoded)
        #
        # @param tenant_id [String] The tenant ID
        #
        # @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ArkEmail::Models::Tenants::SuppressionDeleteResponse]
        #
        # @see ArkEmail::Models::Tenants::SuppressionDeleteParams
        def delete(email, params)
          parsed, options = ArkEmail::Tenants::SuppressionDeleteParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["tenants/%1$s/suppressions/%2$s", tenant_id, email],
            model: ArkEmail::Models::Tenants::SuppressionDeleteResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [ArkEmail::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
