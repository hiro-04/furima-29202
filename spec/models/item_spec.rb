require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品の保存ができる場合' do
    context "商品が保存できる場合" do
      it "必須項目を記入すると商品は保存される" do
        expect(@item).to be_valid
      end
    end

    context "商品が保存できない場合" do
      it "画像がないと商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "商品名が空だと保存できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "カテゴリーが空だと保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が空だと保存できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担が空だと保存できない" do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "発送元の地域が空だと保存できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "配送料の負担が空だと保存できない" do
        @item.days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "価格が空だと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300~99999999円以外では保存できない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
    end
  end
end