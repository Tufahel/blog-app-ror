require 'rails_helper'
RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Tufahel', photo: 'pic.png', bio: 'Developer from Bangladesh',
                        posts_counter: 0)
    Post.create(title: 'Title', text: 'Text', author_id: @user.id,
                likes_counter: 0, comments_counter: 0, id: 2)
    @comment = Comment.create(text: 'First comment', author: User.first, post: Post.first)
    @comment = Comment.create(text: 'Second comment', author: User.first, post: Post.first)
    @like = Like.create(author_id: User.first.id, post_id: Post.first.id)
    visit user_posts_path(@user.id)
    visit "/users/#{@user.id}/posts"
  end
  describe 'View posts' do
    scenario 'I can see the users profile picture.' do
      expect(page.first('img')['src']).to have_content 'pic.png'
    end
    scenario 'I can see the users username.' do
      expect(page).to have_content 'Tufahel'
    end
    scenario 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 1'
    end
    scenario 'I can see the posts title.' do
      expect(page).to have_content 'Title'
    end
    scenario 'I can see the posts body.' do
      expect(page).to have_content 'Text'
    end
    scenario 'I can see the first comments on a post.' do
      expect(page).to have_content 'First comment'
      expect(page).to have_content 'Second comment'
    end
    scenario 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments: 2'
    end
    scenario 'I can see how many likes a post has.' do
      expect(page).to have_content 'Likes: 1'
    end
    scenario 'See a section of pagination' do
      expect(page).to have_content('1')
      expect(page).to have_content('2')
    end
    scenario "When I click on a post, it redirects me to that post's show page." do
      visit user_post_path(@user.id, '2')
      expect(page).to have_current_path user_post_path(@user.id, '2')
    end
  end
end
