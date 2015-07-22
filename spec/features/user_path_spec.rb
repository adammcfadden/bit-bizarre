require 'rails_helper'

describe 'user path' do
  it 'will allow an admin to view all users' do
    admin = create(:admin)
    login_as admin, scope: :user
    visit users_path
    expect(page).to have_content "All Users"
  end

  it 'will not allow a user to view all users' do
    user = create(:user)
    login_as user, scope: :user
    visit users_path
    expect(page).to have_content "not authorized"
  end

  it 'will allow an admin to delte a user' do
    admin = create(:admin)
    user = create(:user)
    login_as admin, scope: :user
    visit users_path
    click_link "delete_user_#{user.id}"
    expect(page).to_not have_content user.email
  end

  it 'will allow a user to view an item if they are logged in' do
    user = create(:user)
    item = create(:item, user_id: user.id)
    login_as user, scope: :user
    visit item_path(item)
    expect(page).to have_content item.body
  end

  it 'will not allow a user to view an item if they are not logged in' do
    item = create(:item)
    visit item_path(item)
    expect(page).to have_content "You must sign in to do this."
  end
end
