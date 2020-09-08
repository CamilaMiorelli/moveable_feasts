class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_path(@user)
      flash.notice = "Your review has been sent to the user"
    else
      render 'user/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:review_title, :review_description, :rating)
  end
end
