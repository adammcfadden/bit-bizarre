class Cart < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :items

  def calc_cost
    cost = 0
    if items != nil
      items.each do |item|
        cost += item.price
      end
    end
    cost
  end
end
