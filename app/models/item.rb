class Item < ActiveRecord::Base

  validates :name, :body, :price, presence: true

  belongs_to :user
end
