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
          #   Unique domain identifier
          #
          #   @return [Integer]
          required :id, Integer

          # @!attribute name
          #   The domain name used for sending emails
          #
          #   @return [String]
          required :name, String

          # @!attribute verified
          #   Whether all DNS records (SPF, DKIM, Return Path) are correctly configured.
          #   Domain must be verified before sending emails.
          #
          #   @return [Boolean]
          required :verified, ArkEmail::Internal::Type::Boolean

          # @!attribute tenant_id
          #   ID of the tenant this domain belongs to (included when filtering by tenant_id)
          #
          #   @return [String, nil]
          optional :tenant_id, String

          # @!attribute tenant_name
          #   Name of the tenant this domain belongs to (included when filtering by tenant_id)
          #
          #   @return [String, nil]
          optional :tenant_name, String

          # @!method initialize(id:, name:, verified:, tenant_id: nil, tenant_name: nil)
          #   Some parameter documentations has been truncated, see
          #   {ArkEmail::Models::DomainListResponse::Data::Domain} for more details.
          #
          #   @param id [Integer] Unique domain identifier
          #
          #   @param name [String] The domain name used for sending emails
          #
          #   @param verified [Boolean] Whether all DNS records (SPF, DKIM, Return Path) are correctly configured. Domai
          #
          #   @param tenant_id [String] ID of the tenant this domain belongs to (included when filtering by tenant_id)
          #
          #   @param tenant_name [String] Name of the tenant this domain belongs to (included when filtering by tenant_id)
        end
      end
    end
  end
end
