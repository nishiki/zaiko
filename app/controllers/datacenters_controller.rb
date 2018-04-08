class DatacentersController < ApplicationController
  def index
    @datacenters = Datacenter.all
  end

  def new
    @datacenter = Datacenter.new
  end

  def show
    @datacenter = Datacenter.find(params[:id])
  end

  def edit
    @datacenter = Datacenter.find(params[:id])
  end

  def update
    @datacenter = Datacenter.find(params[:id])

    if @datacenter.update(datacenter_params)
      redirect_to @datacenter
    else
      render 'edit'
    end
  end

  def create
    @datacenter = Datacenter.new(datacenter_params)

    if @datacenter.save
      redirect_to @datacenter
    else
      render 'new'
    end
  end

  def destroy
    @datacenter = Datacenter.find(params[:id])
    @datacenter.destroy

    redirect_to datacenters_path
  end

  private

  def datacenter_params
    params.require(:datacenter).permit(:name)
  end
end
