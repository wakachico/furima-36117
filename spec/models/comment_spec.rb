require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe 'コメント登録' do
    context 'コメント登録できるとき' do
      it 'sentenceが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント登録できないとき' do
      it 'sentenceが空では登録できない' do
        @comment.sentence = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Sentence can't be blank")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @comment.user_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @comment.item_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
