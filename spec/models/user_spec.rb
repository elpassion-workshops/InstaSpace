require 'rails_helper'

describe User do
  let(:user) { User.create }

  describe 'validations' do
    it 'does not create new User without email address' do
      new_user = User.create(first_name: 'John', last_name: 'Doe')
      expect(new_user.errors[:email]).to eq ["can't be blank"]
    end
  end

  describe 'followed users' do
    xit 'should have a followers method' do
      expect(user).to respond_to(:followers)
    end

    xit 'should have a followees method' do
      expect(user).to respond_to(:followees)
    end
  end
end

