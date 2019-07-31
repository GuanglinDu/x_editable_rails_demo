require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article1 = articles(:one)
  end

  test "article should valid" do
    assert @article1.valid?, "should be valid"
  end

  test "title should be present" do
    @article1.title = " "
    assert_not @article1.valid?
  end

  test "content should be present" do
    @article1.content = " "
    assert_not @article1.valid?
  end
end
