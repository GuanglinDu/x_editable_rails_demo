require 'test_helper'

class ArticlesInterfaceTest < ActionDispatch::IntegrationTest
  test "listing articles" do
    get root_path
    assert_template :index
    assert_response :success

    # Heading, title input field, & content area
    assert_select 'h3', 'Listing Articles'
    assert_select 'input[type="text"]'
    assert_select '#article_content', count: 1
    assert_select 'input[type="submit"]', count: 1

    # Creates a new article: (1) invalid submission,
    assert_no_difference 'Article.count' do
      post articles_path, article: { title: "Article 3", content: "" }
    end
    assert_select 'div#error_explanation'
    
    # and, then, (2) valid submission
    content = "This is article 3." 
    assert_difference 'Article.count', 1 do
      post articles_path, article: { title: "Article 3", content: content }
    end

  end
end
