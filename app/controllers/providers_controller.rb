class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
  end

  def new
    @provider = Provider.new
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(params[:id])

    if @provider.update(provider_params)
      redirect_to @provider
    else
      render 'edit'
    end
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider
    else
      render 'new'
    end
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy

    redirect_to providers_path
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :address)
  end
end
