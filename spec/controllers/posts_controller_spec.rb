require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'post controller' do
    context 'index action' do
      subject { User.new(name: 'Bajeri') }
      before { subject.save }
      before(:each) { get "/users/#{subject.id}/posts/" }

      it 'render index action' do
        expect(response).to render_template(:index)
      end

      it 'return status code ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'return index view text' do
        expect(response.body).to include('Posts index method')
      end
    end

    context 'show action' do
      subject { User.new(name: 'Bajeri') }
      before { subject.save }

      it 'render index action' do
        post = Post.new(author: subject, title: 'Hello, I’m Tom from Mexico and am a Teacher',
                        text: 'This is my first post')
        post.save!
        get "/users/#{subject.id}/posts/#{post.id}"
        expect(response).to render_template(:show)
      end

      it 'return status code ok' do
        post = Post.new(author: subject, title: 'Hello, I’m Tom from Mexico and am a Teacher',
                        text: 'This is my first post')
        post.save!
        get "/users/#{subject.id}/posts/#{post.id}"
        expect(response).to have_http_status(:ok)
      end

      it 'return show view text' do
        post = Post.new(author: subject, title: 'Hello, I’m Tom from Mexico and am a Teacher',
                        text: 'This is my first post')
        post.save!
        get "/users/#{subject.id}/posts/#{post.id}"
        expect(response.body).to include('Posts show method')
      end
    end
  end
end
