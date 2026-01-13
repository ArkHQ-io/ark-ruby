# frozen_string_literal: true

require_relative "../test_helper"

class Ark::Test::Resources::SuppressionsTest < Ark::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @ark.suppressions.create(address: "user@example.com")

    assert_pattern do
      response => Ark::Models::SuppressionCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionCreateResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::SuppressionCreateResponse::Success
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @ark.suppressions.retrieve("dev@stainless.com")

    assert_pattern do
      response => Ark::Models::SuppressionRetrieveResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionRetrieveResponse::Data | nil,
        success: Ark::Internal::Type::Boolean | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @ark.suppressions.list

    assert_pattern do
      response => Ark::Internal::EmailsPage
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
        success: Ark::Models::SuppressionListResponse::Success
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @ark.suppressions.delete("dev@stainless.com")

    assert_pattern do
      response => Ark::SuccessResponse
    end

    assert_pattern do
      response => {
        data: Ark::SuccessResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::SuccessResponse::Success
      }
    end
  end

  def test_bulk_create_required_params
    skip("Prism tests are disabled")

    response = @ark.suppressions.bulk_create(suppressions: [{address: "dev@stainless.com"}])

    assert_pattern do
      response => Ark::Models::SuppressionBulkCreateResponse
    end

    assert_pattern do
      response => {
        data: Ark::Models::SuppressionBulkCreateResponse::Data,
        meta: Ark::APIMeta,
        success: Ark::Models::SuppressionBulkCreateResponse::Success
      }
    end
  end
end
