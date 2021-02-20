require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、family_name_furigana、first_name_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数混合6文字以上であれば登録できる' do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_furiganaが空では登録できない' do
        @user.family_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
      end
      it 'first_name_furiganaが空では登録できない' do
        @user.first_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが５文字以下であれば登録できない' do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "123abc"
        @user.password_confirmation = "123xyz"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'family_name_furiganaがカタカナでなければ登録できない' do
        @user.family_name_furigana = "いなば"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana is invalid")
      end
      it 'first_name_furiganaがカタカナでなければ登録できない' do
        @user.first_name_furigana = "こうし"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end
    end
  end
end
