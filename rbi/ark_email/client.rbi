# typed: strong

module ArkEmail
  class Client < ArkEmail::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # Use your API key from
    # [arkhq.io/org/credentials](https://arkhq.io/org/credentials)
    #
    # ```
    # Authorization: Bearer YOUR_API_KEY
    # ```
    sig { returns(String) }
    attr_reader :api_key

    sig { returns(ArkEmail::Resources::Emails) }
    attr_reader :emails

    sig { returns(ArkEmail::Resources::Domains) }
    attr_reader :domains

    sig { returns(ArkEmail::Resources::Suppressions) }
    attr_reader :suppressions

    sig { returns(ArkEmail::Resources::Webhooks) }
    attr_reader :webhooks

    sig { returns(ArkEmail::Resources::Tracking) }
    attr_reader :tracking

    sig { returns(ArkEmail::Resources::Logs) }
    attr_reader :logs

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Use your API key from
      # [arkhq.io/org/credentials](https://arkhq.io/org/credentials)
      #
      # ````
      # Authorization: Bearer YOUR_API_KEY
      # ``` Defaults to `ENV["ARK_API_KEY"]`
      # ````
      api_key: ENV["ARK_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["ARK_BASE_URL"]`
      base_url: ENV["ARK_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: ArkEmail::Client::DEFAULT_MAX_RETRIES,
      timeout: ArkEmail::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: ArkEmail::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: ArkEmail::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
