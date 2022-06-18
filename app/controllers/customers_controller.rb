class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @customers = Customer.select(:id,:name,:birth_date).all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
      @customer = Customer.new(customer_params)
      if @customer.save
        flash[:notice] = 'Customer added!'
        redirect_to customers_path
      else
        flash[:error] = 'Failed to edit Customer!'
        render :new
      end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:notice] = 'Customer updated!'
      redirect_to customers_path
    else
      flash[:error] = 'Failed to edit Customer!'
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.delete
      flash[:notice] = 'Customer deleted!'
      redirect_to customers_path
    else
      flash[:error] = 'Failed to delete this Customer!'
      render :destroy
    end
  end

  def customer_params
     params.require(:customer).permit(:name, :birth_date)
  end
end
