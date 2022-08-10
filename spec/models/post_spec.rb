require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Spec for post model' do
    before(:each) do
      @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                       posts_counter: 0)
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
    end

    it 'Title must not blank' do
      @post.title = nil
      expect(@post).to_not be_valid

      @post.title = 'Brother'
      expect(@post).to be_valid
    end

    it 'Title must not exceed 250 characters' do
      @post.title = 'Less than 250 character'
      expect(@post).to be_valid
    end

    it 'Comment counter must be an integer greater than or equall to zero' do
      @post.comments_counter = 'string'
      expect(@post).to_not be_valid

      @post.comments_counter = -1
      expect(@post).to_not be_valid

      @post.comments_counter = 1
      expect(@post).to be_valid
    end

    it 'Likes counter must be an integer greater than or equall to zero' do
      @post.likes_counter = 'string'
      expect(@post).to_not be_valid

      @post.likes_counter = -1
      expect(@post).to_not be_valid

      @post.likes_counter = 1
      expect(@post).to be_valid
    end
  end
end