class Facade
  def initialize(data)
    @data = data
  end

  def students
    @data.map do |student|
      Student.new(student)
    end
  end
end
