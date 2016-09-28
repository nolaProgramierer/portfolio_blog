require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @article = Article.new(title: "Title", body: "Now is the time...")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "title should not be too short" do
    @article.title = "a" * 2
    assert_not @article.valid?
  end

  test "body of article should be present" do
    @article.body = "    "
    assert_not @article.valid?
  end
end
