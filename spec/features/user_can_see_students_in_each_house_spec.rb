require 'rails_helper'

context 'As a user visiting / ' do
  it 'I can see access the different students in each house' do

    visit '/'

    select "Slytherin", from: "house"

    click_on "Get Students"

    expect(current_path).to eq('/search')

    expect(page).to have_content("22 Students")
    expect(page).to have_css(".student", count: 22)
    expect(page).to have_css(".name", count: 22)
    expect(page).to have_css(".id", count: 22)
    expect(page).to have_content("Name: Lucius Malfoy Id: 63")
  end
end
