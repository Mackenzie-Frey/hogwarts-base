class StudentService
  def initialize(params)
    @house = params['house']
  end

  def house_students
    house
  end

  def house
    houses = parse(conn.get)
    house_id(houses)
  end

  def students(house_id)
    binding.pry
    response = conn.get(house_id.to_s)
    parse(response)
  end


  def house_id(houses)
    houses.each do |house|
      if house['name'] == @house
        students(house['id'])
      end
    end
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: 'http://hogwarts-as-a-service.herokuapp.com/api/v1/house/') do |faraday|
      faraday.headers['x_api_key'] = ENV['hogwarts_as_a_service_api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
