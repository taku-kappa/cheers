json.data do
  json.items do
    json.array!(@posts) do |post|
      json.id post.id
      json.user do
        json.name post.user.name
        json.image url_for(post.user.get_profile_image)
      end
      json.shop_name post.shop_name
      json.image1 post.image1
      json.address post.address
      json.latitude post.latitude
      json.longitude post.longitude
    end
  end
end