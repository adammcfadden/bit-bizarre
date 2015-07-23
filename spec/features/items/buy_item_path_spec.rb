require 'rails_helper'

describe "the buy item path", js: true do
  it "will let a user purchase an item" do
    item = create(:item)
    user = create(:user)
    login_as user, scope: :user
    visit item_path(item)
    click_on "Pay with Card"
    # stripe = page.driver.window_handles.last
# binding.pry
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
