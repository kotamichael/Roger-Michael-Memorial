require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
	test "full title helper" do
		assert_equal full_title, "Roger Mark Michael | In Memoriam"
		assert_equal full_title("Help"), "Help | Roger Mark Michael | In Memoriam"
	end
end