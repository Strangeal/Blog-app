require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'post controller' do
    context 'index action' do
      it 'render index action' do
        get '/users/24/posts/'
        expect(response).to render_template(:index)
      end

      it 'return status code ok' do
        get '/users/24/posts/'
        expect(response).to have_http_status(:ok)
      end

      it 'return index view text' do
        get '/users/24/posts/'
        expect(response.body).to include('Posts index method')
      end
    end

    context 'show action' do
      it 'render index action' do
        get '/users/24/posts/123'
        expect(response).to render_template(:show)
      end

      it 'return status code ok' do
        get '/users/24/posts/123'
        expect(response).to have_http_status(:ok)
      end

      it 'return show view text' do
        get '/users/24/posts/123'
        expect(response.body).to include('Posts show method')
      end
    end
  end
end
