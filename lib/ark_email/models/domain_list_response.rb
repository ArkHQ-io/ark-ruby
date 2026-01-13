# frozen_string_literal: true

module ArkEmail
  module Models
    # @see ArkEmail::Resources::Domains#list
    class DomainListResponse < ArkEmail::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [ArkEmail::Models::DomainListResponse::Data]
      required :data, -> { ArkEmail::Models::DomainListResponse::Data }

      # @!attribute meta
      #
      #   @return [ArkEmail::Models::APIMeta]
      required :meta, -> { ArkEmail::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [ArkEmail::Models::DomainListResponse::Data]
      #   @param meta [ArkEmail::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see ArkEmail::Models::DomainListResponse#data
      class Data < ArkEmail::Internal::Type::BaseModel
        # @!attribute domains
        #
        #   @return [Array<ArkEmail::Models::DomainListResponse::Data::Domain>]
        required :domains,
                 -> { ArkEmail::Internal::Type::ArrayOf[ArkEmail::Models::DomainListResponse::Data::Domain] }

        # @!method initialize(domains:)
        #   @param domains [Array<ArkEmail::Models::DomainListResponse::Data::Domain>]

        class Domain < ArkEmail::Internal::Type::BaseModel
          # @!attribute id
          #   Domain ID
          #
          #   @return [String]
          required :id, String

          # @!attribute dns_ok
          #
          #   @return [Boolean]
          required :dns_ok, ArkEmail::Internal::Type::Boolean, api_name: :dnsOk

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute verified
          #
          #   @return [Boolean]
          required :verified, ArkEmail::Internal::Type::Boolean

          # @!method initialize(id:, dns_ok:, name:, verified:)
          #   @param id [String] Domain ID
          #
          #   @param dns_ok [Boolean]
          #
          #   @param name [String]
          #
          #   @param verified [Boolean]
        end
      end
    end
  end
end
