require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'User controller' do
    context 'index action' do
      it 'render index action' do
        get '/'
        expect(response).to render_template(:index)
      end

      it 'return status code ok' do
        get '/'
        expect(response).to have_http_status(:ok)
      end

      it 'return index view text' do
        get '/'
        expect(response.body).to include('Users Index action')
      end
    end

    context 'show action' do
      subject { User.new(name: 'Bajeri') }
      before { subject.save }
      before(:each) { get "/users/#{subject.id}/" }

      it 'render show action' do
        expect(response).to render_template(:show)
      end

      it 'return status code ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'return show view text' do
        expect(response.body).to include('Users show method')
      end
    end
  end
end
