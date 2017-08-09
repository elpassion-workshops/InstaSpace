require 'rails_helper'

describe User do
  let(:user) { User.new(first_name: 'John', last_name: 'Doe') }
  it 'does not create new User without email address' do
    new_user = user.save

    expect(new_user.errors.messages).to eq ({ email: ["can't be blank"] })
  end
end
