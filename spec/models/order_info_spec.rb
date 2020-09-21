require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @order_info = FactoryBot.build(:order_info, user_id: @user.id, item_id: @item.id)
  end
  
  describe '購入情報が保存できる場合' do
    context "購入情報が保存できる場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_info).to be_valid
      end
    end

    context "購入情報保存できない場合" do
      it "電話番号がないと商品は保存できない" do
        @order_info.telephone_number = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "電話番号には「-」が不要であること" do
        @order_info.telephone_number = "090-1234-5678"
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Telephone number is invalid")
      end
      it "郵便番号がないと商品は保存できない" do
        @order_info.postal_code = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号には「-」がないと商品は保存できない" do
        @order_info.postal_code = "1234567"
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県がないと商品は保存できない" do
        @order_info.area = ""
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Area can't be blank")
      end
      it "市区町村がないと商品は保存できない" do
        @order_info.city = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("City can't be blank")
      end
      it "市区町村がないと商品は保存できない" do
        @order_info.house_number = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("House number can't be blank")
      end
    end
  end
end
