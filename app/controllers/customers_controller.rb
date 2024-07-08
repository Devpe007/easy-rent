class CustomersController < ApplicationController
  before_action :load_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.order('name')
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new customer_params

    if @customer.save
      redirect_to customers_path, notice: 'Cliente cadastrado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @customer.update customer_params
      redirect_to customer_params, notice: 'Cliente atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def customer_params
    params.require(:customer).permit(:name, :dob, :mobile_phone, :email)
  end

  def load_customer
    @customer = Customer.find params[:id]
  end
end
