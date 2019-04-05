class StudentService
  def initialize(params)
    @house = params['house']
  end

  def house_students
    houses = parse(conn.get)
    house_id(houses)
  end

  def students(house_id)
    response = conn.get(house_id.to_s)
    parse(response)
  end

  def house_id(houses)
    sanitize_house
    house_id = houses.find do |house|
      house['name'] == @house
    end['id']
    students(house_id)
  end

  def sanitize_house
    if @house == 'Griffyndor'
      @house = 'Gryffindor'
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
