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
  
  def self.search(keyword)
    shop_key = 'shop_name'
    menu_words = %w(name price description)
    menu_keys = (1..3).map { |i| menu_words.map { |s| "menu#{i}_#{s}" } }
    keys = menu_keys.unshift(shop_key).flatten
    search_keys = keys.map { |s| "#{s} LIKE ?" }.join(" OR ")
    search_values = keys.size.times.map { "%#{keyword}%" }
    sql = search_values.unshift(search_keys)
    where(sql)
  end
end
