class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy


  validates :shop_name, presence: true
  validates :menu1_name, presence: true



end
