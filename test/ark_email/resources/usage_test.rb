# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::UsageTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.usage.retrieve

    assert_pattern do
      response => ArkEmail::Models::UsageRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::UsageRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
