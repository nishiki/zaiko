class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @provider = Provider.find(params[:provider_id])
  end

  def edit
    @contact = Contact.find(params[:id])
    @provider = Provider.find(params[:provider_id])
  end

  def update
    @contact = Contact.find(params[:id])
    @provider = Provider.find(params[:provider_id])

    if @contact.update(contact_params)
      redirect_to Provider.find(params[:provider_id])
    else
      render 'edit'
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @provider = Provider.find(params[:provider_id])

    if @contact.save
      redirect_to Provider.find(params[:provider_id])
    else
      render 'new'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to Provider.find(params[:provider_id])
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :mail, :provider_id)
  end
end
