require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end
  before { subject.save }

  context 'testing validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should be equal "Tom"' do
      expect(subject.name).to eq 'Tom'
    end

    it 'posts_counter should not be letters' do
      subject.posts_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should not be less than 0' do
      subject.posts_counter = -10
      expect(subject).to_not be_valid
    end
  end

  context 'testing method' do
    it 'most_recent_post should be 0' do
      expect(subject.most_recent_post.length).to eq 0
    end
  end
end
