class ClientsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @clients = Client.select(:id,:name).all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = 'Client added!'
      redirect_to clients_path
    else
      flash[:error] = 'Failed to edit Client!'
      render :new
    end
  end

  def update
      @client = Client.find(params[:id])
      if @client.update_attributes(client_params)
        flash[:notice] = 'Client updated!'
        redirect_to clients_path
      else
        flash[:error] = 'Failed to edit Client!'
        render :edit
      end
  end

  def destroy
      @client = Client.find(params[:id])
      if @client.delete
        flash[:notice] = 'Client deleted!'
        redirect_to clients_path
      else
        flash[:error] = 'Failed to delete this Client!'
        render :destroy
      end
  end

  def client_params
      params.require(:client).permit(:name)
  end
end
