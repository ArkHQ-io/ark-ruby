# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::LogsTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.logs.retrieve("req_V8GGcdWYzgeWIHiI")

    assert_pattern do
      response => ArkEmail::Models::LogRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::LogEntryDetail,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.logs.list

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::LogEntry
    end

    assert_pattern do
      row => {
        context: ArkEmail::LogEntry::Context,
        credential: ArkEmail::LogEntry::Credential,
        duration_ms: Integer,
        endpoint: String,
        method_: ArkEmail::LogEntry::Method,
        path: String,
        rate_limit: ArkEmail::LogEntry::RateLimit,
        request_id: String,
        status_code: Integer,
        timestamp: Time,
        email: ArkEmail::LogEntry::Email | nil,
        error: ArkEmail::LogEntry::Error | nil,
        sdk: ArkEmail::LogEntry::SDK | nil
      }
    end
  end
end
