require 'rails_helper'

context 'As a user visiting / ' do
  it 'I can see access the different students in each house' do
    # user = create(:user)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    #from drop down
    select "Slytherin", from: "house"

    click_on "Get Students"

    #with "house=slytherin" in the parameters
    expect(current_path).to eq('/search')

    expect(page).to have_content("Slytherin")
    expect(page).to have_content("22 Students")
    expect(page).to have_css(".students", count: 22)
    expect(page).to have_css(".name", count: 22)
    expect(page).to have_css(".id", count: 22)
    expect(page).to have_content("Name: Some Student name Id: -some id-")
  end
end
