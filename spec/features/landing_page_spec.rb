require 'rails_helper'

describe 'Landing page' do

  scenario 'Unauthorized user visit landing page' do
    visit root_path
    expect(page).to have_selector(:link_or_button, 'Sing in')
    expect(page).to have_selector(:link_or_button, 'Sing up')
  end
end