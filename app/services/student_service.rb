class StudentService
  def initialize(params)
    @house = params['house']
  end

  # def conn(url)
  #   response = Faraday.get(:url => 'http://hogwarts-it.herokuapp.com/api/v1/') do |faraday|
  #     faraday.params['api_key'] = "#{ENV['hogwarts_api_key']}"
  #     faraday.adapter  Faraday.default_adapter
  #   end
  #   JSON.parse(response.body)
  # end

  def house_students
    # binding.pry
    # conn.get("house/#{@house}")
    # binding.pry
    response = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['hogwarts_api_key']}")
    result = JSON.parse(response.body)
  end
end
