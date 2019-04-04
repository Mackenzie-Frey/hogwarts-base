class StudentService
  def initialize(params)
    @house = params['house']
  end

  def house_students
    get_json("house/#{@house}")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: 'http://hogwarts-it.herokuapp.com/api/v1/') do |faraday|
      faraday.params['api_key'] = ENV['hogwarts_api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end

# https://hogwarts-as-a-service.herokuapp.com/api/v1/house/
# x_api_key
# response = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['hogwarts_api_key']}")
# hogwarts_as_a_service_api_key
