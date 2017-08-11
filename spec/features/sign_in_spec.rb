require 'rails_helper'

describe 'Sign in' do
  let(:user_password) {"qweqweqwe"}
  let!(:user) { User.create(first_name: 'Jon', last_name: 'Snow', email: "a@example.com", password: user_password) }

  context 'with valid data given' do
    scenario 'user signs in' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user_password
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq root_path
    end
  end

  context 'with invalid data given' do
    scenario 'user cannot sign in' do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'wrong pass'
      click_button 'Sign in'
      expect(page).to have_content 'Invalid Email or password.'
      expect(current_path).to eq new_user_session_path
    end
  end
end
