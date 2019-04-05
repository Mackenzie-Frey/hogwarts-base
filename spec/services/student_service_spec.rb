require 'rails_helper'

context 'Student Service' do
  it 'exists' do
    service = StudentService.new({"house"=>"Slytherin"})

    expect(service).to be_a(StudentService)
  end

  it 'receives params and outputs a list of students' do
    service = StudentService.new({"house"=>"Griffyndor"}).house_students

    binding.pry
    expect(service[0]).to eq({
        "id": 1,
        "name": "Albus Dumbledore"
    })
  end
end
