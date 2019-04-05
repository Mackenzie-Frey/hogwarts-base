class StudentService
  def initialize(params)
    @house = params['house']
  end

  def house_students
    JSON.parse((conn.get).body)
    house_id
  end

  def house_id
    binding.pry
    id = nil
    conn.each do |house|
      if house['name'] == @house
        id = house['id']
      end
    end
    binding.pry
    id
  end

  # curl -H 'X_API_KEY: oPGaRUMm7Cpisj6fosH8VhIgjnxx8zh1' 'https://hogwarts-as-a-service.herokuapp.com/api/v1/house'


  def conn
    Faraday.new(url: 'http://hogwarts-as-a-service.herokuapp.com/api/v1/house') do |faraday|
      faraday.headers['x_api_key'] = ENV['hogwarts_as_a_service_api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
