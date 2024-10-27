class BreedsController < ApplicationController
  def index
    @breeds = Dog.select(:breed).distinct
  end

  def show
    @breed = params[:breed_id]
    @dogs = Dog.where(breed: @breed)
  end
end
