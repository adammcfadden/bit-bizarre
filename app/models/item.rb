class Item < ActiveRecord::Base

  has_attached_file :avatar, styles: { medium: "300x300>", fit: "100x100>" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, :body, :price, presence: true
  belongs_to :user
  has_and_belongs_to_many :carts

  def self.most_recent
    order(created_at: :desc)[0..5]
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
