class RoomsController < ApplicationController
  def new
    @room = Room.new
    @datacenter = Datacenter.find(params[:datacenter_id])
  end

  def edit
    @room = Room.find(params[:id])
    @datacenter = Datacenter.find(params[:datacenter_id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to Datacenter.find(params[:datacenter_id])
    else
      render 'edit'
    end
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to Datacenter.find(params[:datacenter_id])
    else
      render 'new'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to Datacenter.find(params[:datacenter_id])
  end

  private

  def room_params
    params.require(:room).permit(:name, :datacenter_id)
  end
end
