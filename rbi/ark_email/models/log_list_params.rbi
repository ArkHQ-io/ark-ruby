# typed: strong

module ArkEmail
  module Models
    class LogListParams < ArkEmail::Internal::Type::BaseModel
      extend ArkEmail::Internal::Type::RequestParameters::Converter
      include ArkEmail::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ArkEmail::LogListParams, ArkEmail::Internal::AnyHash)
        end

      # Filter by API credential ID
      sig { returns(T.nilable(String)) }
      attr_reader :credential_id

      sig { params(credential_id: String).void }
      attr_writer :credential_id

      # Filter logs before this date (ISO 8601 format)
      sig { returns(T.nilable(Time)) }
      attr_reader :end_date

      sig { params(end_date: Time).void }
      attr_writer :end_date

      # Filter by endpoint name
      sig { returns(T.nilable(String)) }
      attr_reader :endpoint

      sig { params(endpoint: String).void }
      attr_writer :endpoint

      # Page number
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Results per page (max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :per_page

      sig { params(per_page: Integer).void }
      attr_writer :per_page

      # Filter by request ID (partial match)
      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig { params(request_id: String).void }
      attr_writer :request_id

      # Filter logs after this date (ISO 8601 format)
      sig { returns(T.nilable(Time)) }
      attr_reader :start_date

      sig { params(start_date: Time).void }
      attr_writer :start_date

      # Filter by status category:
      #
      # - `success` - Status codes < 400
      # - `error` - Status codes >= 400
      sig { returns(T.nilable(ArkEmail::LogListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: ArkEmail::LogListParams::Status::OrSymbol).void }
      attr_writer :status

      # Filter by exact HTTP status code (100-599)
      sig { returns(T.nilable(Integer)) }
      attr_reader :status_code

      sig { params(status_code: Integer).void }
      attr_writer :status_code

      sig do
        params(
          credential_id: String,
          end_date: Time,
          endpoint: String,
          page: Integer,
          per_page: Integer,
          request_id: String,
          start_date: Time,
          status: ArkEmail::LogListParams::Status::OrSymbol,
          status_code: Integer,
          request_options: ArkEmail::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by API credential ID
        credential_id: nil,
        # Filter logs before this date (ISO 8601 format)
        end_date: nil,
        # Filter by endpoint name
        endpoint: nil,
        # Page number
        page: nil,
        # Results per page (max 100)
        per_page: nil,
        # Filter by request ID (partial match)
        request_id: nil,
        # Filter logs after this date (ISO 8601 format)
        start_date: nil,
        # Filter by status category:
        #
        # - `success` - Status codes < 400
        # - `error` - Status codes >= 400
        status: nil,
        # Filter by exact HTTP status code (100-599)
        status_code: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            credential_id: String,
            end_date: Time,
            endpoint: String,
            page: Integer,
            per_page: Integer,
            request_id: String,
            start_date: Time,
            status: ArkEmail::LogListParams::Status::OrSymbol,
            status_code: Integer,
            request_options: ArkEmail::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by status category:
      #
      # - `success` - Status codes < 400
      # - `error` - Status codes >= 400
      module Status
        extend ArkEmail::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ArkEmail::LogListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS = T.let(:success, ArkEmail::LogListParams::Status::TaggedSymbol)
        ERROR = T.let(:error, ArkEmail::LogListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ArkEmail::LogListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
