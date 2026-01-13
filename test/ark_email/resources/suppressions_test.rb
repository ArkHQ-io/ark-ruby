# frozen_string_literal: true

require_relative "../test_helper"

class ArkEmail::Test::Resources::SuppressionsTest < ArkEmail::Test::ResourceTest
  def test_create_required_params
    response = @ark.suppressions.create(address: "user@example.com")

    assert_pattern do
      response => ArkEmail::Models::SuppressionCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::SuppressionCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.suppressions.retrieve("dev@stainless.com")

    assert_pattern do
      response => ArkEmail::Models::SuppressionRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::SuppressionRetrieveResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.suppressions.list

    assert_pattern do
      response => ArkEmail::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => ArkEmail::Models::SuppressionListResponse
    end

    assert_pattern do
      row => {
        id: String,
        address: String,
        created_at: Time,
        reason: String | nil
      }
    end
  end

  def test_delete
    response = @ark.suppressions.delete("dev@stainless.com")

    assert_pattern do
      response => ArkEmail::Models::SuppressionDeleteResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::SuppressionDeleteResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end

  def test_bulk_create_required_params
    response = @ark.suppressions.bulk_create(suppressions: [{address: "dev@stainless.com"}])

    assert_pattern do
      response => ArkEmail::Models::SuppressionBulkCreateResponse
    end

    assert_pattern do
      response => {
        data: ArkEmail::Models::SuppressionBulkCreateResponse::Data,
        meta: ArkEmail::APIMeta,
        success: true | false
      }
    end
  end
end
