require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "Roger Mark Michael | In Memoriam"
	end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get bio" do
    get bio_path
    assert_response :success
    assert_select "title", "Biography | #{@base_title}"
  end

  test "should get share" do
    get share_path
    assert_response :success
    assert_select "title", "Share | #{@base_title}"
  end

  test "should get information" do
  	get information_path
  	assert_response :success
  	assert_select "title", "Service Information | #{@base_title}"
  end

  test "should get giving" do
  	get giving_path
  	assert_response :success
  	assert_select "title", "Giving | #{@base_title}"
  end
end
