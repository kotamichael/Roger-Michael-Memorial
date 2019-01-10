require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "Roger Mark Michael | In Memoriam"
	end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Roger Mark Michael | In Memoriam"
  end

  test "should get share" do
    get share_path
    assert_response :success
    assert_select "title", "Share | #{@base_title}"
  end

  test "should get about" do
  	get about_path
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
  	get contact_path
  	assert_response :success
  	assert_select "title", "Contact | #{@base_title}"
  end
end
