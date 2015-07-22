class Item < ActiveRecord::Base

  validates :name, :body, :price, presence: true

end
