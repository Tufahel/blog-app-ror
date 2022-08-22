require 'rails_helper'

RSpec.describe 'Testing user show page', type: :feature do
  before(:each) do
    User.destroy_all
    @first = User.create(name: 'Tufahel', photo: 'pic.png',
                         bio: 'Developer', posts_counter: 0)
    # 10.times do |num|
    #     @post = Post.create(title: "Post #{num}", text: "This is my #{num} post",
    #         likes_counter: 0, comments_counter: 0, id: "#{num}" )
    # end
    Post.create(title: 'Title1', text: 'This is my 7 post', author_id: @first.id,
                likes_counter: 0, comments_counter: 0, id: 1)
    Post.create(title: 'Title2', text: 'This is my 8 post', author_id: @first.id,
                likes_counter: 0, comments_counter: 0, id: 2)
    Post.create(title: 'Title3', text: 'This is my 9 post', author_id: @first.id,
                likes_counter: 0, comments_counter: 0, id: 3)

    visit user_path(@first.id)
    # visit user_path(@first.id)
  end

  scenario "I can see the user's profile picture" do
    expect(page.first('img')['src']).to have_content 'pic.png'
  end

  scenario "I can see the user's username" do
    expect(page).to have_content('Tufahel')
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 3')
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content('Developer')
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content 'This is my 7 post'
    expect(page).to have_content 'This is my 8 post'
    expect(page).to have_content 'This is my 9 post'
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    click_link('See all posts')
    expect(current_path).to eq user_posts_path(User.first.id)
  end

  scenario "When I click a user's post, it redirects me to that post's show page." do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@first)

    visit user_post_url('1', '2')
    expect(page).to have_content 'Like'
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page." do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@first)

    visit user_posts_path(@first.id)
  end
end
