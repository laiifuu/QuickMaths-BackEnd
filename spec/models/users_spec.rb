require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test user model' do
    it 'Add valid user' do
      user = User.create(username: 'Daron01')
      expect(user).to be_valid
    end

    it 'Add invalid user with short username' do
      user = User.create(username: 'Daron')
      expect(user).not_to be_valid
    end

    it 'Add invalid user with long username' do
      user = User.create(username: 'DaronDaronDaronDaron1')
      expect(user).not_to be_valid
    end

    it 'Add user already in use' do
      User.create(username: 'Daron1')
      user = User.create(username: 'Daron1')
      expect(user).not_to be_valid
    end
  end
end
