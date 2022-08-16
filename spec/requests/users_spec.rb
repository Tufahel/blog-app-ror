require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get('/users') }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct text' do
      expect(response.body).to include 'List of users.'
    end
  end

  describe 'GET #show' do
    before(:example) { get('/users/2') }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders show' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct text' do
      expect(response.body).to include('Show details of an user.')
    end
  end
end
