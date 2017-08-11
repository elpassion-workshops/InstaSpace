require 'rails_helper'

describe 'Latest pagination' do
  let(:user_password) {"qweqweqwe"}
  let!(:user) { User.create(first_name: 'Jon', last_name: 'Snow', email: "a@example.com", password: user_password) }

  context 'with 2 pictures in database' do
    let!(:pictures) do
      2.times do
        Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                       description: 'Fancy description', user: user)
      end
    end

    scenario 'user can see 2 pictures' do
      visit latest_path
      expect(page).to have_selector('div.single-picture', count: 2)
    end
  end

  context 'with 10 pictures in database' do
    let!(:pictures) do
      10.times do
        Picture.create(file: File.new("#{Rails.root}/app/assets/images/picture#{rand(1..5)}.jpeg"),
                       description: 'Fancy description', user: user)
      end
    end

    scenario 'user can see 8 pictures' do
      visit latest_path
      expect(page).to have_selector('div.single-picture', count: 8)
    end

    scenario 'user clicks next page' do
      visit latest_path
      click_link_or_button 'Next'
      expect(page).to have_selector('div.single-picture', count: 2)
    end
  end
end