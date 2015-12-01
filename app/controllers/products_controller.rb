class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order(name: :asc, tamanho: :asc)
    @totalproducts = Product.where(:user_id => current_user.id).count
    @totalcusto = Product.where(:user_id => current_user.id).sum(:price)
    @totalprecovenda = Product.where(:user_id => current_user.id).sum(:valuev)
    #@totalvalorct = Product.where(:user_id => current_user.id).sum(:value_carat)

    respond_to do |format|
      format.html # don't forget if you pass html
      #format.xls { send_data(@products.to_xls) }
      format.csv { send_data @products.to_csv }
      format.xls #{ send_data @products.to_csv(col_sep: "\t")  }
        # format.xls {
        # filename = "Produtos-#{Time.now.strftime("%d-%m-%Y")}.xls"
        # send_data(@products.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
        #  }
    end


  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = current_user.products.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :weight, :user_id, :quantity, :forma, :tamanho, :codigo, :valuev, :sale_ids => [])
    end
end
