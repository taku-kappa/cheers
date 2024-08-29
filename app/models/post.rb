class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy


  validates :shop_name, presence: true
  validates :menu1_name, presence: true


  #def self.search(search)
    #if search != ""
      #Post.where('shop_name LIKE(?) OR menu1_name LIKE(?) OR menu1_price LIKE(?) OR menu1_description LIKE(?) OR
      #menu2_name LIKE(?) OR menu2_price LIKE(?) OR menu2_description LIKE(?) OR menu3_name LIKE(?) OR menu3_price LIKE(?) OR menu3_description LIKE(?)',
      #"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").exists?
    #elsif
      #User.where('name LIKE(?)', "%#{params[:keyword]}%").exists?
    #else
      #render "post/index"
    #end
  #end

end
