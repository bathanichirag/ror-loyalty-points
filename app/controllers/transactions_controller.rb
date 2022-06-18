class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:notice] = 'Transaction added!'
      redirect_to transactions_path
    else
      flash[:error] = 'Failed to edit Transaction!'
      render :new
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      flash[:notice] = 'Transaction updated!'
      redirect_to transactions_path
    else
      flash[:error] = 'Failed to edit Transaction!'
      render :edit
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    if @transaction.delete
      flash[:notice] = 'Transaction deleted!'
      redirect_to transactions_path
    else
      flash[:error] = 'Failed to delete this Transaction!'
      render :destroy
    end
  end

  def transaction_params
     params.require(:transaction).permit(:client_id, :customer_id, :amount, :currency_code, :transaction_date)
  end
end
