require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  before(:each) do
    @first = User.create(name: 'Tufahel', photo: 'pic.png', bio: 'Developer.',
                         posts_counter: 0)

    @second = User.create(name: 'Ahmed', photo: 'pic1.jpg',
                          bio: 'Student.', posts_counter: 0)

    visit root_path
  end

  feature 'User Index' do
    background { visit root_path }
    scenario 'See all usernames' do
      expect(page).to have_content('Tufahel')
      expect(page).to have_content('Ahmed')
    end
  end

  scenario 'See profile picture for each user' do
    expect(page.first('img')['src']).to have_content 'pic.png'
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 0')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link 'Tufahel', match: :first
    expect(current_path).to eq user_path(User.first.id)
  end
end
