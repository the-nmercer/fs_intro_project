class DogsController < ApplicationController
  def index
    @dogs = Dogs.page(params[:page]).per(20)
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
