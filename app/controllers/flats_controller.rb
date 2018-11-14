class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :destroy, :edit, :update]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(val_params)
    if @flat.save
      redirect_to flats_path, notice: "Successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(val_params)
    if @flat.save
      redirect_to flat_path(@flat), notice: "Successfully updated!"
    else
      render :new
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path(@flat), notice: "Successfully deleted!"
  end

  def search
    @keyword = params[:query]
    @flats = Flat.where("name LIKE '%#{@keyword}%'")
    redirect_to flats_path, notice: "You searched for #{@keyword}. No matched result found." if @flats.empty?
  end

  private

  def val_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
