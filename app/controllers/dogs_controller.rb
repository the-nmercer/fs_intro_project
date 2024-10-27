class DogsController < ApplicationController
  def index
    @dogs = Dog.limit(10)
  end
end
