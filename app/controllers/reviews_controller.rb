require 'json'
require 'http'
require 'YelpApiAdapter'

class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def bryants
    #@BryantsData = YelpApiAdapter.search("Bryant's Cocktail Lounge", "Milwaukee")
    bryantID = YelpApiAdapter.search("Bryant's Cocktail Lounge", "Milwaukee")[0]["id"]

    reviews = YelpApiAdapter.business_reviews(bryantID)

    for review in reviews

    Review.create(:review_id => review["id"], :review_rating  => review["rating"], :user_id => review["user"]["id"], :user_profile_url => review["user"]["profile_url"], :user_image_url => review["user"]["image_url"], :user_name => review["user"]["name"], :review_text => review["text"], :review_time_created => review["time_created"], :review_url => review["url"])

    end 
  
  end

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:review_id, :review_rating, :user_id, :user_profile_url, :user_image_url, :user_name, :review_text, :review_time_created, :review_url)
    end
end
