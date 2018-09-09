class PinsController < ApplicationController
  def index
    @pins = Pin.all.order('created_at DESC')
  end

  def new
    @pin = current_user.pins.build
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Successfully created your Pin!"
    else
      render 'new'
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])

    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was Successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy

    redirect_to pins_path, notice: "Pin was Successfully Deleted!"
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

end
