# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get get_started" do
    get pages_get_started_url
    assert_response :success
  end
end
