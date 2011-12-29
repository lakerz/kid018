require 'test_helper'

class ArticleCommentsControllerTest < ActionController::TestCase
  setup do
    @article_comment = article_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_comment" do
    assert_difference('ArticleComment.count') do
      post :create, :article_comment => @article_comment.attributes
    end

    assert_redirected_to article_comment_path(assigns(:article_comment))
  end

  test "should show article_comment" do
    get :show, :id => @article_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @article_comment.to_param
    assert_response :success
  end

  test "should renew_avatar article_comment" do
    put :update, :id => @article_comment.to_param, :article_comment => @article_comment.attributes
    assert_redirected_to article_comment_path(assigns(:article_comment))
  end

  test "should destroy article_comment" do
    assert_difference('ArticleComment.count', -1) do
      delete :destroy, :id => @article_comment.to_param
    end

    assert_redirected_to article_comments_path
  end
end
