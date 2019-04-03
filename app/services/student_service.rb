class StudentService
  def initialize(params)
    @house = params['house']
  end

  def house_students
    response = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['hogwarts_api_key']}")
    result = JSON.parse(response.body)
    # binding.pry
  end
end
