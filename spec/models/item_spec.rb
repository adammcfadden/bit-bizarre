require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :body }
  it { should validate_presence_of :price }

  describe ".most_recent" do
    it "will return the 6 most recently added items" do
      20.times do
        FactoryGirl.create(:item, name: Faker::Commerce.product_name, body: Faker::Lorem.paragraph(2), price: Faker::Commerce.price)
      end
      expect(Item.most_recent.length).to eq 6
    end
  end
end
