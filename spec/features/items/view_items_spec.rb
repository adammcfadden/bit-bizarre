require 'rails_helper'

describe "The item path" do
  it "lets the user go to the the items index" do
    user_login
    item = FactoryGirl.create(:item)
    visit items_path
    expect(page).to have_content("Thing")
  end

  it "let the user go to an item page" do
    user_login
    item = FactoryGirl.create(:item)
    visit item_path(item)
    expect(page).to have_content("Thing")
    expect(page).to have_content("Was in the trash")
    expect(page).to have_content("$43.56")
  end
end
