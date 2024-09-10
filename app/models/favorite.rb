class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :posts


  validates :user_id, uniqueness: {scope: :post_id}

end
