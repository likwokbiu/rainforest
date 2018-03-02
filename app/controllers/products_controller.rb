class ProductsController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_product, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @reviews = @product.reviews.order(created_at: :desc)
    @review = Review.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new

    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]
    @product.user_id = current_user.id

    if @product.save
      flash[:notice] = "You have successfully added #{@product.name}!"
      redirect_to products_path
    else
      render new_product_path
    end

  end

  def edit
  end

  def update
    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]

    if @product.save
      flash[:notice] = "You have successfully updated #{@product.name}!"
      redirect_to product_path(@product.id)
    else
      redirect_to edit_product_path(@product.id)
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "You have successfully deleted #{@product.name}!"
    redirect_to products_path
  end

  def load_product
    @product = Product.find(params[:id])
  end

  def ensure_user_owns_product
    unless current_user == @product.user
      flash[:alert] = "Please log in"
      redirect_to new_sessions_path
    end
  end

end
