require 'rails_helper'

describe 'Sign in' do
  let!(:user) { User.create(first_name: 'Jon', last_name: 'Snow', email: 'a@example.com', password: 'qweqweqwe') }

  context 'with valid data given' do
    scenario 'user signs in' do
      visit new_user_session_path
      fill_in 'user_email', with: 'a@example.com'
      fill_in 'user_password', with: 'qweqweqwe'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq root_path
    end
  end

  context 'with invalid data given' do
    scenario 'user cannot sign in' do
      visit new_user_session_path
      fill_in 'user_email', with: 'a@example.co'
      fill_in 'user_password', with: 'qweqweqwe'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
      expect(current_path).to eq new_user_session_path
    end
  end
end