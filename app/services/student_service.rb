class StudentService
  def initialize(params)
    @house = params['house']
  end

  def house_students
    house
  end

  def house
    response = JSON.parse((conn.get).body)
    house_id(response)
  end

  def students
    binding.pry
  end

  def house_id(response)
    binding.pry
    response.each do |house|
      if house['name'] == @house
        students(house['id'])
      end
    end
  end

  def conn
    Faraday.new(url: 'http://hogwarts-as-a-service.herokuapp.com/api/v1/house') do |faraday|
      faraday.headers['x_api_key'] = ENV['hogwarts_as_a_service_api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
