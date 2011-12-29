require 'test_helper'

class ArticleCommentRepliesControllerTest < ActionController::TestCase
  setup do
    @article_comment_reply = article_comment_replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_comment_replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_comment_reply" do
    assert_difference('ArticleCommentReply.count') do
      post :create, :article_comment_reply => @article_comment_reply.attributes
    end

    assert_redirected_to article_comment_reply_path(assigns(:article_comment_reply))
  end

  test "should show article_comment_reply" do
    get :show, :id => @article_comment_reply.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @article_comment_reply.to_param
    assert_response :success
  end

  test "should renew_avatar article_comment_reply" do
    put :update, :id => @article_comment_reply.to_param, :article_comment_reply => @article_comment_reply.attributes
    assert_redirected_to article_comment_reply_path(assigns(:article_comment_reply))
  end

  test "should destroy article_comment_reply" do
    assert_difference('ArticleCommentReply.count', -1) do
      delete :destroy, :id => @article_comment_reply.to_param
    end

    assert_redirected_to article_comment_replies_path
  end
end
