class ProductsController < ApplicationController

  before_action :find_product, only:[:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "新增商品成功"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "商品更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "商品已刪除"
  end

  private

  def find_product
    @prodcut = Prodcut.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
