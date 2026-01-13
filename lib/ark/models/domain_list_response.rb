# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Domains#list
    class DomainListResponse < Ark::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Ark::Models::DomainListResponse::Data]
      required :data, -> { Ark::Models::DomainListResponse::Data }

      # @!attribute meta
      #
      #   @return [Ark::Models::APIMeta]
      required :meta, -> { Ark::APIMeta }

      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(data:, meta:, success: true)
      #   @param data [Ark::Models::DomainListResponse::Data]
      #   @param meta [Ark::Models::APIMeta]
      #   @param success [Boolean, true]

      # @see Ark::Models::DomainListResponse#data
      class Data < Ark::Internal::Type::BaseModel
        # @!attribute domains
        #
        #   @return [Array<Ark::Models::DomainListResponse::Data::Domain>]
        required :domains, -> { Ark::Internal::Type::ArrayOf[Ark::Models::DomainListResponse::Data::Domain] }

        # @!method initialize(domains:)
        #   @param domains [Array<Ark::Models::DomainListResponse::Data::Domain>]

        class Domain < Ark::Internal::Type::BaseModel
          # @!attribute id
          #   Domain ID
          #
          #   @return [String]
          required :id, String

          # @!attribute dns_ok
          #
          #   @return [Boolean]
          required :dns_ok, Ark::Internal::Type::Boolean, api_name: :dnsOk

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute verified
          #
          #   @return [Boolean]
          required :verified, Ark::Internal::Type::Boolean

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
