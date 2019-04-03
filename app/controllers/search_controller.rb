class SearchController < ApplicationController
  def index
    response = Faraday.get('http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=3fhZMZNXVndxk51mILsdVnGN6tF8KBI6')
    result = JSON.parse(response.body)
    @facade = Facade.new(result).students
  end
end
