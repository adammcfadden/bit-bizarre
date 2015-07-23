require 'rails_helper'

describe "the buy item path", js: true do
# This test is dependent on the animation finishing, and therefore Capybara's default wait time to be extended. If failing, extend the 'Capybara.default_wait_time' in spec_helper.rb
  it "will let a user purchase an item" do
    item = create(:item)
    user = create(:user)
    login_as user, scope: :user
    visit item_path(item)
    click_on "Pay with Card"
    Capybara.within_frame 'stripe_checkout_app' do
      fill_in "email", with: user.email
      fill_in "card_number", with: "4242424242424242"
      fill_in "cc-exp", with: "0716"
      fill_in "cc-csc", with: "424"
      click_on "submitButton"
    end
    expect(page).to have_content "Thanks, you paid"
  end
end
