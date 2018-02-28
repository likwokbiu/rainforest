class ReviewsController < ApplicationController

  def create
    @review = Review.new

    @review.comment = params[:review][:comment]
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to "/products/#{params[:product_id]}"
    else
      flash[:alert] = "Review cannot be empty!"
      redirect_to "/products/#{params[:product_id]}"
    end

  end

  def edit
    @review = Review.find(params[:id])
  end

  def update

  end

  def destroy

  end

end
