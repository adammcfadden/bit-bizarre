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
end
