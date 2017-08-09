require 'rails_helper'

describe User do
  let(:user) { User.create }

  describe 'validations' do
    it 'does not create new User without email address' do
      new_user = User.new(first_name: 'John', last_name: 'Doe')

      expect(new_user.errors.messages).to eq ({ email: ["can't be blank"] })
    end
  end

  describe 'followed users' do
    it 'should have a followers method' do
      expect(user).to respond_to(:followers)
    end

    it 'should have a followees method' do
      expect(user).to respond_to(:followees)
    end
  end
end

