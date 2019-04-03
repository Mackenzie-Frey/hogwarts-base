class Facade
  def initialize(data)
    @data = data
  end

  def students
    thing = @data['data'][0]['attributes']['students']
    thing.map do |student|
      Student.new(student)
    end
  end
end
