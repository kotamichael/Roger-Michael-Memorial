require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @food = @user.foods.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @food.valid?
  end

  test "user id should be present" do
    @food.user_id = nil
    assert_not @food.valid?
  end

  test "content should be present" do
    @food.content = "   "
    assert_not @food.valid?
  end

  test "content should be at most 140 characters" do
    @food.content = "a" * 141
    assert_not @food.valid?
  end

  test "order should be most recent first" do
    assert_equal foods(:most_recent), Food.first
  end
end
