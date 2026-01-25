# typed: strong

module ArkEmail
  module Models
    class LogEntryDetail < ArkEmail::Models::LogEntry
      OrHash =
        T.type_alias do
          T.any(ArkEmail::LogEntryDetail, ArkEmail::Internal::AnyHash)
        end

      # Request body information
      sig { returns(T.nilable(ArkEmail::LogEntryDetail::Request)) }
      attr_reader :request

      sig { params(request: ArkEmail::LogEntryDetail::Request::OrHash).void }
      attr_writer :request

      # Response body information
      sig { returns(T.nilable(ArkEmail::LogEntryDetail::Response)) }
      attr_reader :response

      sig { params(response: ArkEmail::LogEntryDetail::Response::OrHash).void }
      attr_writer :response

      # Full API request log entry with bodies
      sig do
        params(
          request: ArkEmail::LogEntryDetail::Request::OrHash,
          response: ArkEmail::LogEntryDetail::Response::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Request body information
        request: nil,
        # Response body information
        response: nil
      )
      end

      sig do
        override.returns(
          {
            request: ArkEmail::LogEntryDetail::Request,
            response: ArkEmail::LogEntryDetail::Response
          }
        )
      end
      def to_hash
      end

      class Request < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::LogEntryDetail::Request,
              ArkEmail::Internal::AnyHash
            )
          end

        # Decrypted request body (JSON or string). Bodies over 25KB are truncated.
        sig do
          returns(T.nilable(ArkEmail::LogEntryDetail::Request::Body::Variants))
        end
        attr_accessor :body

        # Original request body size in bytes
        sig { returns(T.nilable(Integer)) }
        attr_accessor :body_size

        # Request body information
        sig do
          params(
            body: T.nilable(ArkEmail::LogEntryDetail::Request::Body::Variants),
            body_size: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Decrypted request body (JSON or string). Bodies over 25KB are truncated.
          body: nil,
          # Original request body size in bytes
          body_size: nil
        )
        end

        sig do
          override.returns(
            {
              body:
                T.nilable(ArkEmail::LogEntryDetail::Request::Body::Variants),
              body_size: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end

        # Decrypted request body (JSON or string). Bodies over 25KB are truncated.
        module Body
          extend ArkEmail::Internal::Type::Union

          Variants = T.type_alias { T.any(T::Hash[Symbol, T.anything], String) }

          sig do
            override.returns(
              T::Array[ArkEmail::LogEntryDetail::Request::Body::Variants]
            )
          end
          def self.variants
          end

          UnionMember0Map =
            T.let(
              ArkEmail::Internal::Type::HashOf[
                ArkEmail::Internal::Type::Unknown
              ],
              ArkEmail::Internal::Type::Converter
            )
        end
      end

      class Response < ArkEmail::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ArkEmail::LogEntryDetail::Response,
              ArkEmail::Internal::AnyHash
            )
          end

        # Decrypted response body (JSON or string). Bodies over 25KB are truncated.
        sig do
          returns(T.nilable(ArkEmail::LogEntryDetail::Response::Body::Variants))
        end
        attr_accessor :body

        # Response body size in bytes
        sig { returns(T.nilable(Integer)) }
        attr_accessor :body_size

        # Response body information
        sig do
          params(
            body: T.nilable(ArkEmail::LogEntryDetail::Response::Body::Variants),
            body_size: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Decrypted response body (JSON or string). Bodies over 25KB are truncated.
          body: nil,
          # Response body size in bytes
          body_size: nil
        )
        end

        sig do
          override.returns(
            {
              body:
                T.nilable(ArkEmail::LogEntryDetail::Response::Body::Variants),
              body_size: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end

        # Decrypted response body (JSON or string). Bodies over 25KB are truncated.
        module Body
          extend ArkEmail::Internal::Type::Union

          Variants = T.type_alias { T.any(T::Hash[Symbol, T.anything], String) }

          sig do
            override.returns(
              T::Array[ArkEmail::LogEntryDetail::Response::Body::Variants]
            )
          end
          def self.variants
          end

          UnionMember0Map =
            T.let(
              ArkEmail::Internal::Type::HashOf[
                ArkEmail::Internal::Type::Unknown
              ],
              ArkEmail::Internal::Type::Converter
            )
        end
      end
    end
  end
end
