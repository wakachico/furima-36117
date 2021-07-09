require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '商品出品ができる場合' do
      it 'Itemsテーブル内の全てのカラムがあれば商品出品できる' do
        expect(@item).to be_valid
      end
      it '販売価格が300円であれば商品出品できる（下限検証）' do
        @item.selling_price = 300
        expect(@item).to be_valid
      end
      it '販売価格が9999999円であれば商品出品できる（上限検証）' do
        @item.selling_price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it '商品画像が空では商品出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では商品出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では商品出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが「---」では商品出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が「---」では商品出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it '配送料の負担が「---」では商品出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end
      it '発送元の地域 が「---」では商品出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数が「---」では商品出品できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time must be other than 1")
      end
      it '販売価格が空では商品出品できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が300円以下では商品出品できない' do
        @item.selling_price = 299
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end
      it '販売価格が10000000円以上では商品出品できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end
      it '販売価格が全角数字では商品出品できない' do
        @item.selling_price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
