# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::SuppressionsTest < Ark::Test::ResourceTest
  def test_create_required_params
    response = @ark.suppressions.create(address: "user@example.com")

    assert_pattern do
      response => Ark::Models::SuppressionCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionCreateResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_retrieve
    response = @ark.suppressions.retrieve("dev@stainless.com")

    assert_pattern do
      response => Ark::Models::SuppressionRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionRetrieveResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_list
    response = @ark.suppressions.list

    assert_pattern do
      response => Ark::Internal::PageNumberPagination
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Ark::Models::SuppressionListResponse
    end

    assert_pattern do
      row => {
        data: Ark::Models::SuppressionListResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_delete
    response = @ark.suppressions.delete("dev@stainless.com")

    assert_pattern do
      response => Ark::Models::SuppressionDeleteResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionDeleteResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end

  def test_bulk_create_required_params
    response = @ark.suppressions.bulk_create(suppressions: [{address: "dev@stainless.com"}])

    assert_pattern do
      response => Ark::Models::SuppressionBulkCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionBulkCreateResponse::Data,
        meta: Ark::APIMeta,
        success: true | false
      }
    end
  end
end
