require 'rails_helper'

describe "The edit item path" do
  it "lets the user edit an item" do
    user = create(:user)
    item = create(:item, user_id: user.id)
    login_as user, scope: :user
    visit edit_item_path(item)
    fill_in 'Name', with: 'table'
    fill_in 'Body', with: 'it is a great table'
    fill_in 'Price', with: '5.58'
    click_on "Update Item"
    expect(page).to have_content("Item updated")
  end

  it "will not let the user edit an item if they leave something blank" do
    user = create(:user)
    item = create(:item, user_id: user.id)
    login_as user, scope: :user
    visit edit_item_path(item)
    fill_in 'Name', with: ''
    click_on "Update Item"
    expect(page).to have_content("error")
  end

  it "will not let a user edit an item if they are not logged in" do
    item = create(:item)
    visit edit_item_path(item)
    expect(page).to have_content "not authorized"
  end

end
