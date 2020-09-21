class OrderInfo

  include ActiveModel::Model
  attr_accessor :telephone_number, :postal_code, :area, :city, :area, :house_number, :building_name, :token, :item_id, :user_id
  
  ##addressのvalidation
  with_options presence: true do
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :area
  end
  

  ##orderのvalidation
    validates :token, presence:true
  
  def save
    ##住所の情報を保存
    order = Order.create!(user_id: user_id, item_id: item_id)
    
    Address.create!(telephone_number: telephone_number, postal_code: postal_code, area: area, building_name: building_name, order_id: order.id)
  end

  
end

