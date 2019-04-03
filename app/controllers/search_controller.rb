class SearchController < ApplicationController
  def index
binding.pry
    @facade = Faraday.get('http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=3fhZMZNXVndxk51mILsdVnGN6tF8KBI6')

  end
end
