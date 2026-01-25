# frozen_string_literal: true

module ArkEmail
  module Models
    class LogEntryDetail < ArkEmail::Models::LogEntry
      # @!attribute request
      #   Request body information
      #
      #   @return [ArkEmail::Models::LogEntryDetail::Request, nil]
      optional :request, -> { ArkEmail::LogEntryDetail::Request }

      # @!attribute response
      #   Response body information
      #
      #   @return [ArkEmail::Models::LogEntryDetail::Response, nil]
      optional :response, -> { ArkEmail::LogEntryDetail::Response }

      # @!method initialize(request: nil, response: nil)
      #   Full API request log entry with bodies
      #
      #   @param request [ArkEmail::Models::LogEntryDetail::Request] Request body information
      #
      #   @param response [ArkEmail::Models::LogEntryDetail::Response] Response body information

      class Request < ArkEmail::Internal::Type::BaseModel
        # @!attribute body
        #   Decrypted request body (JSON or string). Bodies over 25KB are truncated.
        #
        #   @return [Hash{Symbol=>Object}, String, nil]
        optional :body, union: -> { ArkEmail::LogEntryDetail::Request::Body }, nil?: true

        # @!attribute body_size
        #   Original request body size in bytes
        #
        #   @return [Integer, nil]
        optional :body_size, Integer, api_name: :bodySize, nil?: true

        # @!method initialize(body: nil, body_size: nil)
        #   Request body information
        #
        #   @param body [Hash{Symbol=>Object}, String, nil] Decrypted request body (JSON or string). Bodies over 25KB are truncated.
        #
        #   @param body_size [Integer, nil] Original request body size in bytes

        # Decrypted request body (JSON or string). Bodies over 25KB are truncated.
        #
        # @see ArkEmail::Models::LogEntryDetail::Request#body
        module Body
          extend ArkEmail::Internal::Type::Union

          variant -> { ArkEmail::Models::LogEntryDetail::Request::Body::UnionMember0Map }

          variant String

          # @!method self.variants
          #   @return [Array(Hash{Symbol=>Object}, String)]

          # @type [ArkEmail::Internal::Type::Converter]
          UnionMember0Map = ArkEmail::Internal::Type::HashOf[ArkEmail::Internal::Type::Unknown]
        end
      end

      class Response < ArkEmail::Internal::Type::BaseModel
        # @!attribute body
        #   Decrypted response body (JSON or string). Bodies over 25KB are truncated.
        #
        #   @return [Hash{Symbol=>Object}, String, nil]
        optional :body, union: -> { ArkEmail::LogEntryDetail::Response::Body }, nil?: true

        # @!attribute body_size
        #   Response body size in bytes
        #
        #   @return [Integer, nil]
        optional :body_size, Integer, api_name: :bodySize, nil?: true

        # @!method initialize(body: nil, body_size: nil)
        #   Response body information
        #
        #   @param body [Hash{Symbol=>Object}, String, nil] Decrypted response body (JSON or string). Bodies over 25KB are truncated.
        #
        #   @param body_size [Integer, nil] Response body size in bytes

        # Decrypted response body (JSON or string). Bodies over 25KB are truncated.
        #
        # @see ArkEmail::Models::LogEntryDetail::Response#body
        module Body
          extend ArkEmail::Internal::Type::Union

          variant -> { ArkEmail::Models::LogEntryDetail::Response::Body::UnionMember0Map }

          variant String

          # @!method self.variants
          #   @return [Array(Hash{Symbol=>Object}, String)]

          # @type [ArkEmail::Internal::Type::Converter]
          UnionMember0Map = ArkEmail::Internal::Type::HashOf[ArkEmail::Internal::Type::Unknown]
        end
      end
    end
  end
end
