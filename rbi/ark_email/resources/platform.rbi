# typed: strong

module ArkEmail
  module Resources
    class Platform
      sig { returns(ArkEmail::Resources::Platform::Webhooks) }
      attr_reader :webhooks

      # @api private
      sig { params(client: ArkEmail::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
