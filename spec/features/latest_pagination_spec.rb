require 'rails_helper'
require 'database_cleaner'

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

  context 'User visits latest page' do
    before do
      visit latest_path 
    end
    it 'should have pagination section' do
      expect(page).to have_selector(:css, '.pagination')
    end
    it 'should have 8 images' do
      expect(page).to have_selector(:css, 'div.single-picture', count: 8)
    end
  end
end
