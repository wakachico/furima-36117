require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) 
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'Userモデルにある全てのカラム(nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthday)が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a1a1a1a1'
        @user.password_confirmation = 'a1a1a1a1'
        expect(@user).to be_valid
      end
      it 'emailは＠を含めば登録できる' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000' 
        @user.password_confirmation = '00000' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'emailは＠を含まない場合登録できない' do
        @user.email = "sampleSample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'famiry_nameが半角カタカナでは登録できない' do
        @user.family_name = "ｵｶﾞﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角の漢字、ひらがな、カタカナを使用してください")
      end
      it 'family_nameが半角英字（ローマ字）では登録できない' do
        @user.family_name = "Ogata"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角の漢字、ひらがな、カタカナを使用してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角カタカナでは登録できない' do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角の漢字、ひらがな、カタカナを使用してください")
      end
      it 'first_nameが半角英字（ローマ字）では登録できない' do
        @user.first_name = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角の漢字、ひらがな、カタカナを使用してください")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'famiry_name_kanaが半角カタカナでは登録できない' do
        @user.family_name_kana = "ｵｶﾞﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角のカタカナを使用してください")
      end
      it 'family_name_kanaが半角英字（ローマ字）では登録できない' do
        @user.family_name_kana = "Ogata"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角のカタカナを使用してください")
      end
      it 'family_name_kanaが漢字では登録できない' do
        @user.family_name_kana = "緒方"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角のカタカナを使用してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが半角カタカナでは登録できない' do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角のカタカナを使用してください")
      end
      it 'first_name_kanaが半角英字（ローマ字）では登録できない' do
        @user.first_name_kana = "Taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角のカタカナを使用してください")
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角のカタカナを使用してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
