# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::LimitsTest < ArkEmail::Test::ResourceTest
  def test_retrieve
    response = @ark.limits.retrieve

    assert_pattern do
      response => ArkEmail::Models::LimitRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::LimitsData,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
