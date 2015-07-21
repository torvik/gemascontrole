class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all.order("created_at DESC")
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @customers = Customer.where(:user_id => current_user.id)
  end

  # GET /sales/new
  def new
    #@user = current_user.id
    @products = Product.where(:user_id => current_user.id)
    @customers = Customer.where(:user_id => current_user.id)
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
    @products = Product.all
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    #@products = Product.where(:id => params[:sales_product])
    #@sales.products << @products
    @sale.user_id = current_user.id

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:date_sale, :amount, :qtd_itens, :user_id,:customer_id, :product_ids => [] )
    end
end
