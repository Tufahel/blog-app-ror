RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Tufahel', photo: 'pic.png', bio: 'Developer from Bangladesh',
                        email: 'tufahel96@mail.com', password: '1234abc',
                        confirmed_at: Time.now, role: 'admin', posts_counter: 0)
    Post.create(title: 'Title', text: 'Text', author_id: @user.id,
                likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(text: 'First comment', author: User.first, post: Post.first)
    @comment = Comment.create(text: 'Second comment', author: User.first, post: Post.first)
    @like = Like.create(author_id: User.first.id, post_id: Post.first.id)
  end
  describe 'View posts' do
    scenario 'See a section of pagination' do
      expect(page).to have_content('1')
      expect(page).to have_content('2')
    end
    scenario 'I can see the posts title.' do
        expect(page).to have_content 'Title'
    end
    scenario 'I can see who wrote the post' do
      expect(page).to have_content 'Tufahel'
    end
    scenario 'I can see the post text.' do
      expect(page).to have_content 'Text'
    end
    scenario 'I can see the post likes counter.' do
      expect(page).to have_content 'Likes: 1'
    end
    scenario 'I can see the post comments.' do
        expect(page).to have_content 'First comment'
        expect(page).to have_content 'Second comment'
    end
    scenario 'I can see the post comments counter.' do
        expect(page).to have_content 'Comments: 2'
    end
  end
end