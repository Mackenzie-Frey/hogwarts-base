class Facade
  def initialize(json_response)
    binding.pry
    @json_response = json_response
  end

  def students
@json_response['data'][0]['attributes']['students']
  end
end
