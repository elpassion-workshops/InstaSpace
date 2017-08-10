require 'rails_helper'

describe 'Registration' do

  context 'with valid data given' do
    scenario 'user signs up' do
      visit new_user_registration_path
      fill_in 'user_email', with: 'abc@example.com'
      fill_in 'user_password', with: 'qweqweqwe'
      fill_in 'user_password_confirmation', with: 'qweqweqwe'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(current_path).to eq root_path
    end
  end

  context 'with invalid data given' do
    scenario 'user cannot sign up' do
      visit new_user_registration_path
      click_button 'Sign up'
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end
  end
end