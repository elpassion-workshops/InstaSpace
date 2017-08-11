require 'rails_helper'

describe 'latest' do

  before do 
    user = User.create!(first_name: 'Jon', email: 'admin@admin.com',
                    password: 'secretsecret', password_confirmation: 'secretsecret',
                    avatar: File.new("#{Rails.root}/app/assets/images/jon_snow.jpg"))
    20.times do
      Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                 description: 'Fancy description', user: user)
    end
  end

  scenario 'visits latest page' do
    visit latest_path
    expect(page).to have_selector(:css, '.pagination')
    expect(page).to have_selector('div.single-picture', count: 8)
  end
end