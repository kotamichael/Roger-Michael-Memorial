require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @food = foods(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Food.count' do
      post foods_path, params: { food: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Food.count' do
      delete food_path(@food)
    end
    assert_redirected_to login_url
  end
end
