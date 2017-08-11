require 'rails_helper'

describe 'Landing page' do
  before do
    user = User.create!(first_name: 'Jon', email: 'admin@admin.com',
                    password: 'secretsecret', password_confirmation: 'secretsecret',
                    avatar: File.new("#{Rails.root}/app/assets/images/jon_snow.jpg"))
    20.times do
      Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                 description: 'Fancy description', user: user)
    end
  end

  scenario 'Unauthorized user visit landing page' do
    visit root_path
    expect(page).to have_selector(:link_or_button, 'Sing in')
    expect(page).to have_selector(:link_or_button, 'Sing up')
  end
end