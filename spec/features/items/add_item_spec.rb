require 'rails_helper'

describe "The item path" do
  it "lets the user add an item" do
    user_login
    visit '/'
    click_on 'Add Item'
    fill_in 'Name', with: 'table'
    fill_in 'Body', with: 'it is a great table'
    fill_in 'Price', with: '5.58'
    click_on "Create Item"
    expect(page).to have_content("Welcome to Bit-Bizarre")
    expect(page).to have_content("table")
    expect(page).to have_content("it is a great table")
    expect(page).to have_content("$5.58")
  end

  it "will not let a user add an item if they are not logged in" do
    visit new_item_path
    expect(page).to have_content("You are not authorized to perform this action.")
  end

  it 'lets the user destroy an item' do
     user_login
     item = create(:item, user_id: @user.id)
     visit item_path(item)
     click_on 'Delete Item'
     expect(page).to have_no_content('it is a great table')
  end

  it "throws an error is a field is left blank" do
    user_login
    visit '/'
    click_on 'Add Item'
    fill_in 'Name', with: 'table'
    fill_in 'Price', with: '5.58'
    click_on "Create Item"
    expect(page).to_not have_content("Welcome to Bit-Bizarre")
    expect(page).to have_content("Please Fix the Following Errors:")
  end
end
