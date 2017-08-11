require 'rails_helper'

describe 'Landing page' do

  before do
    @user = User.create!(first_name: 'Jon', email: 'admin@admin.com',
                    password: 'secretsecret', password_confirmation: 'secretsecret',
                    avatar: File.new("#{Rails.root}/app/assets/images/jon_snow.jpg"))
  end

  context 'User visits latest page with 3 pages' do
    before do
      20.times do
      Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                 description: 'Fancy description', user: @user)
      end
      visit latest_path 
    end
    it 'should have pagination section' do
      expect(page).to have_selector(:css, '.pagination')
    end
    it 'should have 8 images' do
      expect(page).to have_selector(:css, 'div.single-picture', count: 8)
    end
  end

  context 'User visits latest page with 6 pictures' do
    before do
      6.times do
      Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                 description: 'Fancy description', user: @user)
      end
      visit latest_path 
    end
    it 'should have 6 images' do
      expect(page).to have_selector(:css, 'div.single-picture', count: 6)
    end
    it 'should not have pagination' do
      expect(page).not_to have_selector(:css, '.pagination')
    end
  end
end
