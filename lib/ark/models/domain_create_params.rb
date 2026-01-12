# frozen_string_literal: true

module Ark
  module Models
    # @see Ark::Resources::Domains#create
    class DomainCreateParams < Ark::Internal::Type::BaseModel
      extend Ark::Internal::Type::RequestParameters::Converter
      include Ark::Internal::Type::RequestParameters

      # @!attribute name
      #   Domain name (e.g., "mail.example.com")
      #
      #   @return [String]
      required :name, String

      # @!method initialize(name:, request_options: {})
      #   @param name [String] Domain name (e.g., "mail.example.com")
      #
      #   @param request_options [Ark::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
