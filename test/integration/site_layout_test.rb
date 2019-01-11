require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "layout links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", bio_path
		assert_select "a[href=?]", share_path
		assert_select "a[href=?]", information_path
		assert_select "a[href=?]", giving_path
		get signup_path
		assert_select "title", full_title("Sign up")
	end
end
