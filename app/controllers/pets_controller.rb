class PetsController < ApplicationController

  before_action :current_user, :is_authenticated
  #this forces us to be logged in to use these routes

  def index
    @pets = Pet.all
  end

  def create
    current_user.pets.create(pet_params)
    redirect_to pets_path
  end

  def new
    @pet = Pet.new
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    p = Pet.find(params[:id])
    p.update(pet_params)
    redirect_to pets_path
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def destroy
    p = Pet.find(params[:id]).delete
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name)
  end


end
