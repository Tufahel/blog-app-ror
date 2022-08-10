require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Spec for user model' do
    before(:each) do
      @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                       posts_counter: 0)
    end

    it 'Name must not blank' do
      @user.name = nil
      expect(@user).to_not be_valid

      @user.name = 'Lilly'
      expect(@user).to be_valid
    end

    it 'Post counter must be an integer greater than or equal to zero' do
      @user.posts_counter = 'string'
      expect(@user).to_not be_valid

      @user.posts_counter = -1
      expect(@user).to_not be_valid

      @user.posts_counter = 1
      expect(@user).to be_valid
    end
  end
end
