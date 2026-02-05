# frozen_string_literal: true

module ArkEmail
  module Resources
    class Platform
      # @return [ArkEmail::Resources::Platform::Webhooks]
      attr_reader :webhooks

      # @api private
      #
      # @param client [ArkEmail::Client]
      def initialize(client:)
        @client = client
        @webhooks = ArkEmail::Resources::Platform::Webhooks.new(client: client)
      end
    end
  end
end
