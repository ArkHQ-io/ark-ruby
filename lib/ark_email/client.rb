# frozen_string_literal: true

module ArkEmail
  class Client < ArkEmail::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Use your API key from
    # [arkhq.io/org/credentials](https://arkhq.io/org/credentials)
    #
    # ```
    # Authorization: Bearer YOUR_API_KEY
    # ```
    # @return [String]
    attr_reader :api_key

    # @return [ArkEmail::Resources::Emails]
    attr_reader :emails

    # @return [ArkEmail::Resources::Domains]
    attr_reader :domains

    # @return [ArkEmail::Resources::Suppressions]
    attr_reader :suppressions

    # @return [ArkEmail::Resources::Webhooks]
    attr_reader :webhooks

    # @return [ArkEmail::Resources::Tracking]
    attr_reader :tracking

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Use your API key from
    # [arkhq.io/org/credentials](https://arkhq.io/org/credentials)
    #
    # ````
    # Authorization: Bearer YOUR_API_KEY
    # ``` Defaults to `ENV["ARK_API_KEY"]`
    # ````
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["ARK_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["ARK_API_KEY"],
      base_url: ENV["ARK_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.arkhq.io/v1"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"ARK_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @emails = ArkEmail::Resources::Emails.new(client: self)
      @domains = ArkEmail::Resources::Domains.new(client: self)
      @suppressions = ArkEmail::Resources::Suppressions.new(client: self)
      @webhooks = ArkEmail::Resources::Webhooks.new(client: self)
      @tracking = ArkEmail::Resources::Tracking.new(client: self)
    end
  end
end
