class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10).order("name ASC")
    @totalcustomers = Customer.where(:user_id => current_user.id).count

    respond_to do |format|
      format.html # don't forget if you pass html
      format.csv { send_data @customers.to_csv }
      format.xls #{ send_data @products.to_csv(col_sep: "\t")  }
      #format.xls { send_data(@customers.to_xls) }
        # format.xls {
        #   filename = "Clientes-#{Time.now.strftime("%d-%m-%Y")}.xls"
        #   send_data(@customers.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
        #  }
    end

  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    respond_to do |format|
      format.html # don't forget if you pass html
      format.docx do
          render docx: 'show', filename: "Cliente-#{@customer.name}-#{Time.now.strftime("%d-%m-%Y")}.docx"
      end

      #format.docx { filename = "Cliente-#{@customer.name}-#{Time.now.strftime("%d-%m-%Y")}.docx" }

      # format.docx {
      #   filename = "Cliente-#{@customer.name}-#{Time.now.strftime("%d-%m-%Y")}.doc"
      #   send_data(
      #     [
      #     "<br>"+"<b style='color:black;font-size: 20px;'>Nome:</b> <span style='font-size: 16px;'>#{@customer.name}</span>",
      #     "<br>"+"<b style='color:black;font-size: 20px;'>E-mail:</b> <span style='font-size: 16px;'>#{@customer.email}</span>",
      #     "<br>"+"<b style='color:black;font-size: 20px;'>Endereço:</b> <span style='font-size: 16px;'>#{@customer.endereco}</span>",
      #     "<br>"+"<b style='color:black;font-size: 20px;'>CEP:</b> <span style='font-size: 16px;'>#{@customer.cep}</span>",
      #     "<br>"+"<b style='color:black;font-size: 20px;'>Cidade:</b> <span style='font-size: 16px;'>#{@customer.cidade}</span>",
      #     "<br>"+"<b style='color:black;font-size: 20px;'>Estado:</b> <span style='font-size: 16px;'>#{@customer.estado}</span>"],
      #     :type => "application/docx; charset=utf-8; header=present",
      #     :filename => filename)
      #   #set_header('msword', "#{@customer.name}.doc") }
      # }

    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer = current_user.customer.find(params[:id])
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
     @customer = current_user.customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :endereco, :cidade, :estado, :telefone_1, :telefone_2, :user_id, :cep)
    end
end
