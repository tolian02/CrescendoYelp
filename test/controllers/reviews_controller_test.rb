require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { review_id: @review.review_id, review_rating: @review.review_rating, review_text: @review.review_text, review_time_created: @review.review_time_created, review_url: @review.review_url, user_id: @review.user_id, user_image_url: @review.user_image_url, user_name: @review.user_name, user_profile_url: @review.user_profile_url }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { review_id: @review.review_id, review_rating: @review.review_rating, review_text: @review.review_text, review_time_created: @review.review_time_created, review_url: @review.review_url, user_id: @review.user_id, user_image_url: @review.user_image_url, user_name: @review.user_name, user_profile_url: @review.user_profile_url }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
