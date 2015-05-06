class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    @products = Admin::Product.all
    @category = Category.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    # byebug
    @category = Category.find(params[:category_id])
    @product = @category.products.build
  end

  # GET /products/1/edit
  def edit

  end

  # POST /products
  # POST /products.json
  def create
  if @category = Category.find(params[:category_id])
     @product= @category.products.build(product_params)
  else
    @product = Admin::Product.new(product_params)
  end 
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_category_products_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: admin_category_products_path }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_category_products_path(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_category_products_path}
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_category_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Admin::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:admin_product).permit(:name, :prise, :discription, :category_id, :image)
    end
end
