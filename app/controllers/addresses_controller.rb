class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: %i[ show edit update destroy ]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user

    if @address.save
      redirect_to new_announcement_path, notice: "Address was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      redirect_to address_url(@address), notice: "Address was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy!

    redirect_to addresses_url, notice: "Address was successfully destroyed."
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:zip_code, :street, :number, :complement, :reference_point, :state, :city, :neighborhood, :user_id)
  end
end
