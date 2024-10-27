class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
  end

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.dogs.includes(:owner, :sub_breed) # Load dogs associated with the breed
  end
end