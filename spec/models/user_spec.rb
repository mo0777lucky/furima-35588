require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての情報を正しく入力すれば、新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it 'emailに@がついていなければ登録できない' do
        @user.email = 'samplesample'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角英数字混合でなければ登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end

      it 'passwordとpassword_confirmationが一緒でなければ登録できないこと' do
        @user.password = 'mo1234'
        @user.password_confirmation = 'mo1235'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end

      it 'last_name_kanjiが空では登録できないこと' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kanji can't be blank")
      end
    
      it 'first_name_kanjiが空では登録できないこと' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kanji can't be blank")
      end
      
      it 'last_name_kanjiが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.last_name_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kanji is invalid")
      end
    
      it 'first_name_kanjiが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.first_name_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kanji is invalid")
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end
    
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end

      it 'last_name_kanaが全角（カタカナ）でなければ登録できないこと' do
        @user.last_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid")
      end
    
      it 'first_name_kanaが全角（カタカナ）でなければ登録できないこと' do
        @user.first_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end
    end
  end
end