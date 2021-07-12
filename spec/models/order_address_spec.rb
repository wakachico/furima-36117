require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入情報の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
      it 'phone_numberは11桁でも保存できること' do
        @order_address.phone_number = Faker::Number.number(digits: 11)
        expect(@order_address).to be_valid
      end
    end

    context '購入情報の保存ができない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含まない半角数字７桁だと保存できないこと' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code は「3桁の半角数字-4桁の半角数字」の形で入力してください")
      end
      it 'postal_codeが全角数字だと保存できないこと' do
        @order_address.postal_code = "１２３-１２３４"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code は「3桁の半角数字-4桁の半角数字」の形で入力してください")
      end
      it 'prefectureが「---」だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        # binding.pry
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが全角数字だと保存できないこと' do
        @order_address.block = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが10桁未満では保存できないこと' do
        @order_address.phone_number = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10桁or11桁の半角数字で入力してください")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_address.phone_number = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10桁or11桁の半角数字で入力してください")
      end
      it 'phone_numberが全角数字では保存できないこと' do
        @order_address.phone_number = "１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10桁or11桁の半角数字で入力してください")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
