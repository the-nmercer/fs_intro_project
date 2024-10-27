class HomeController < ApplicationController
  def index
    @dogs = Dog.all.includes(:owner, :sub_breed)
  end
end