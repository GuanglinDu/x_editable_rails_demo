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

  test "minimum length should be met" do
    @article1.title = "abcd"
    assert_not @article1.valid?
    @article1.title = "abcdef"
    assert @article1.valid?

    @article2 = articles(:two)
    @article2.content = "abcd"
    assert_not @article2.valid?
    @article2.content = "abcde"
    assert @article2.valid?
  end
end
