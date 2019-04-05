require 'rails_helper'

context 'Student Service' do
  it 'exists' do
    service = StudentService.new({"house"=>"Slytherin"})

    expect(service).to be_a(StudentService)
  end

  it '#get_house_students' do
    service = StudentService.new({"house"=>"Griffyndor"}).house_students

    expect(service[0]).to eq({"id"=>1, "name"=>"Albus Dumbledore"})
  end
end
