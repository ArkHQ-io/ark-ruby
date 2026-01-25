# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Logs#list
    class LogListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      # @!attribute credential_id
      #   Filter by API credential ID
      #
      #   @return [String, nil]
      optional :credential_id, String

      # @!attribute end_date
      #   Filter logs before this date (ISO 8601 format)
      #
      #   @return [Time, nil]
      optional :end_date, Time

      # @!attribute endpoint
      #   Filter by endpoint name
      #
      #   @return [String, nil]
      optional :endpoint, String

      # @!attribute page
      #   Page number
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute per_page
      #   Results per page (max 100)
      #
      #   @return [Integer, nil]
      optional :per_page, Integer

      # @!attribute request_id
      #   Filter by request ID (partial match)
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute start_date
      #   Filter logs after this date (ISO 8601 format)
      #
      #   @return [Time, nil]
      optional :start_date, Time

      # @!attribute status
      #   Filter by status category:
      #
      #   - `success` - Status codes < 400
      #   - `error` - Status codes >= 400
      #
      #   @return [Symbol, ArkEmail::Models::LogListParams::Status, nil]
      optional :status, enum: -> { ArkEmail::LogListParams::Status }

      # @!attribute status_code
      #   Filter by exact HTTP status code (100-599)
      #
      #   @return [Integer, nil]
      optional :status_code, Integer

      # @!method initialize(credential_id: nil, end_date: nil, endpoint: nil, page: nil, per_page: nil, request_id: nil, start_date: nil, status: nil, status_code: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ArkEmail::Models::LogListParams} for more details.
      #
      #   @param credential_id [String] Filter by API credential ID
      #
      #   @param end_date [Time] Filter logs before this date (ISO 8601 format)
      #
      #   @param endpoint [String] Filter by endpoint name
      #
      #   @param page [Integer] Page number
      #
      #   @param per_page [Integer] Results per page (max 100)
      #
      #   @param request_id [String] Filter by request ID (partial match)
      #
      #   @param start_date [Time] Filter logs after this date (ISO 8601 format)
      #
      #   @param status [Symbol, ArkEmail::Models::LogListParams::Status] Filter by status category:
      #
      #   @param status_code [Integer] Filter by exact HTTP status code (100-599)
      #
      #   @param request_options [ArkEmail::RequestOptions, Hash{Symbol=>Object}]

      # Filter by status category:
      #
      # - `success` - Status codes < 400
      # - `error` - Status codes >= 400
      module Status
        extend ArkEmail::Internal::Type::Enum

        SUCCESS = :success
        ERROR = :error

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
