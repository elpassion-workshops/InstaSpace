require 'rails_helper'

describe 'Latest pagination' do
  let(:user_password) {"qweqweqwe"}
  let!(:user) { User.create(first_name: 'Jon', last_name: 'Snow', email: "a@example.com", password: user_password) }

  context 'with 2 pictures in database' do
    before do
      2.times do
        Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                       description: 'Fancy description', user: user)
      end
    end

    scenario 'user can see 2 pictures' do
      visit latest_path
      expect(page).to have_selector('div.single-picture', count: 2)
      expect(page).to_not have_link('More')
    end


  end

  context 'with 10 pictures in database' do
    before do
      20.times do
        Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                       description: 'Fancy description', user: user)
      end
    end

    scenario 'user clicks load more' do
      visit latest_path
      expect(page).to have_selector('div.single-picture', count: 8)
      expect(page).to have_link('More')
      click_link_or_button 'More'
      expect(page).to have_selector('div.single-picture', count: 16)
      expect(page).to have_link('More')
      click_link_or_button 'More'
      expect(page).to have_selector('div.single-picture', count: 20)
      expect(page).to_not have_link('More')
    end
  end
end