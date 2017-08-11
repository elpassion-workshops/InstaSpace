require 'rails_helper'
require 'spec_helper'

describe 'Latest pagination' do 
  context 'user visit' do
    
    before do 
      visit latest_path
    end

    it 'should show correct number of pictures' do 
      expect(page).to have_selector('div.single-picture', count: 8)
    end

    it 'should have pagination' do 
      expect(page).to have_selector(:css, '.pagination')
    end
  end
end