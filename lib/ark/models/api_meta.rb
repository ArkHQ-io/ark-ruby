# frozen_string_literal: true

module Ark
  module Models
    class APIMeta < Ark::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique request identifier for debugging and support
      #
      #   @return [String]
      required :request_id, String, api_name: :requestId

      # @!method initialize(request_id:)
      #   @param request_id [String] Unique request identifier for debugging and support
    end
  end
end
