class ProductsController < ApplicationController

  def index
    @products = Product.all

  end

  def show
    @product = Product.find(params[:id])

    @reviews = @product.reviews
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

    if @product.save
      flash[:notice] = "You have successfully added #{@product.name}!"
      redirect_to products_path
    else
      render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

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
    @product = Product.find(params[:id])

    @product.destroy
    flash[:notice] = "You have successfully deleted #{@product.name}!"
    redirect_to products_path

  end

end
