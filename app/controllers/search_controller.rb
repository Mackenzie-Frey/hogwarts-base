class SearchController < ApplicationController
  def index
    result = StudentService.new(params).house_students
    @facade = Facade.new(result).students
  end
end
