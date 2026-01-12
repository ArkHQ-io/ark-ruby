# frozen_string_literal: true

module Ark
  module Resources
    class Suppressions
      # Add an email address to the suppression list. The address will not receive any
      # emails until removed.
      #
      # @overload create(address:, reason: nil, request_options: {})
      #
      # @param address [String] Email address to suppress
      #
      # @param reason [String] Reason for suppression
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::SuppressionCreateResponse]
      #
      # @see Ark::Models::SuppressionCreateParams
      def create(params)
        parsed, options = Ark::SuppressionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "suppressions",
          body: parsed,
          model: Ark::Models::SuppressionCreateResponse,
          options: options
        )
      end

      # Check if a specific email address is on the suppression list
      #
      # @overload retrieve(email, request_options: {})
      #
      # @param email [String] Email address (URL-encoded)
      #
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::SuppressionRetrieveResponse]
      #
      # @see Ark::Models::SuppressionRetrieveParams
      def retrieve(email, params = {})
        @client.request(
          method: :get,
          path: ["suppressions/%1$s", email],
          model: Ark::Models::SuppressionRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Get all email addresses on the suppression list. These addresses will not
      # receive any emails.
      #
      # @overload list(page: nil, per_page: nil, request_options: {})
      #
      # @param page [Integer]
      # @param per_page [Integer]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::SuppressionListResponse]
      #
      # @see Ark::Models::SuppressionListParams
      def list(params = {})
        parsed, options = Ark::SuppressionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "suppressions",
          query: parsed.transform_keys(per_page: "perPage"),
          model: Ark::Models::SuppressionListResponse,
          options: options
        )
      end

      # Remove an email address from the suppression list. The address will be able to
      # receive emails again.
      #
      # @overload delete(email, request_options: {})
      #
      # @param email [String]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::SuccessResponse]
      #
      # @see Ark::Models::SuppressionDeleteParams
      def delete(email, params = {})
        @client.request(
          method: :delete,
          path: ["suppressions/%1$s", email],
          model: Ark::SuccessResponse,
          options: params[:request_options]
        )
      end

      # Add up to 1000 email addresses to the suppression list at once
      #
      # @overload bulk_create(suppressions:, request_options: {})
      #
      # @param suppressions [Array<Ark::Models::SuppressionBulkCreateParams::Suppression>]
      # @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Ark::Models::SuppressionBulkCreateResponse]
      #
      # @see Ark::Models::SuppressionBulkCreateParams
      def bulk_create(params)
        parsed, options = Ark::SuppressionBulkCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "suppressions/bulk",
          body: parsed,
          model: Ark::Models::SuppressionBulkCreateResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Ark::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
