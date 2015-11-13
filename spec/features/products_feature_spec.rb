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

    before do
      visit '/stores'
    end

    scenario 'prompts user to fill out a form, then displays the new product' do

      click_link 'Add new product'
      fill_in 'What are you selling?', with: 'New item'
      fill_in 'Describe the product', with: 'Something really nice'
      fill_in 'Your selling price in SEK', with: '200'
      click_button 'Add Product'
      expect(page).to have_content 'New item'
      expect(current_path).to eq '/stores/my_products'
    end

    scenario 'store owner can\'t add product if productinfo is missing' do
      click_link 'Add new product'
      fill_in 'What are you selling?', with: ''
      fill_in 'Describe the product', with: ''
      fill_in 'Your selling price in SEK', with: ''
      click_button 'Add Product'
      expect(page).to have_content 'Title can\'t be blank'
      expect(page).to have_content 'Description can\'t be blank'
      expect(page).to have_content 'Price is not a number'
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

    scenario 'store owner edits the product information' do
      click_link 'Edit'
      fill_in 'What are you selling?', with: 'Updated information'
      click_button 'Update Product'
      expect(page).to have_content 'Product was updated successfully!'
      expect(page).to have_content 'Updated information'
    end

    scenario 'store owner can\'t edit product if productinfo is erased' do
      click_link 'Edit'
      fill_in 'What are you selling?', with: ''
      fill_in 'Describe the product', with: ''
      fill_in 'Your selling price in SEK', with: ''
      click_button 'Update Product'
      expect(page).to have_content 'Title can\'t be blank'
      expect(page).to have_content 'Description can\'t be blank'
      expect(page).to have_content 'Price is not a number'
    end
  end

  context 'deleting products' do

    before do
      FactoryGirl.create(:product)
      visit '/stores/my_products'
    end

    scenario 'store owner clicks on delete link and product is removed' do
      click_link 'Delete'
      expect(page).to have_content 'Product was deleted successfully!'
      expect(page).to have_content 'There are no products in the system yet.'
    end
  end


end
