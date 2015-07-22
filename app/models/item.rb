class Item < ActiveRecord::Base

  validates :name, :body, :price, presence: true
  belongs_to :user

  def self.most_recent
    order(created_at: :desc)[0..5]
  end
end
