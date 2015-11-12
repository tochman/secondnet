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

  context 'new product have been added' do

    before do
      FactoryGirl.create(:product)
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
      fill_in 'Describe the product', with: 'Something really nice'
      fill_in 'Your selling price in SEK', with: '200'
      click_button 'Add Product'
      expect(page).to have_content 'New item'
      expect(current_path).to eq '/products'
    end
  end

  context 'editing products' do

    before do
      FactoryGirl.create(:product)
      visit '/stores/my_products'
    end

    scenario 'store owner clicks on edit link and is promted a product update form' do
      click_link 'Edit'
      expect(page).to have_content 'Edit product information'
    end

  end


end
