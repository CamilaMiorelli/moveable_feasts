class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.feast = @review
    if @review.save
      redirect_to feast_path(@feast)
    else
      render 'feast/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:review_title, :review_description, :rating)
  end
end
