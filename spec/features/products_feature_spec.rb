require 'rails_helper'
require 'spec_helper'

describe 'products' do

  before do
    visit '/products'
  end

  context 'no products have been added yet and user visits the page' do

    scenario 'it should display a message that there are no products' do
      expect(page).to have_content 'There are no products in the system yet.'
    end
  end

  context 'new post have been added' do

    before do
      Product.create(title: 'New item')
      visit '/products'
    end

    scenario 'should list added products' do
      expect(page).to have_content 'New item'
      expect(page).not_to have_content 'There are no products in the system yet.'
    end
  end

  context 'creating products' do
    scenario 'prompts user to fill out a form, then displays the new product' do
      visit '/stores'
      click_link 'Add new product'
      fill_in 'What are you selling?', with: 'New item'
      click_button 'Add Product'
      expect(page).to have_content 'New item'
      expect(current_path).to eq '/products'
    end
  end

end
