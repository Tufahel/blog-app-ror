require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Spec for comment model' do
    before(:each) do
      @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                       posts_counter: 0)
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
      @comment = Comment.new(text: 'c1', author_id: 2, post_id: 2)
    end

    it 'Text must not blank' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'User id must be an integer' do
      @comment.author_id = nil
      expect(@comment).to_not be_valid
    end

    it 'Post id must be an integer' do
      @comment.post_id = 'string'
      expect(@comment).to_not be_valid
    end
  end
end