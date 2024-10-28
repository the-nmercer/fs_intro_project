class DogsController < ApplicationController
  def index
    if params[:search].present?
      @dogs = Dog.joins(:owner)
                 .where('LOWER(dogs.breed) LIKE LOWER(?) OR LOWER(owners.name) LIKE LOWER(?)', "%#{params[:search]}%", "%#{params[:search]}%")
                 .page(params[:page]).per(20)
    else
      @dogs = Dog.all.page(params[:page]).per(20)
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
