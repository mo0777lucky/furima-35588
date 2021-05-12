require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー商品出品' do
    context '商品出品できるとき' do
      it '全ての情報を正しく入力すれば、商品出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end

      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Title can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end

      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item_description  can't be blank")
      end

      it 'statusが空では登録できない' do
        @item.status = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status can't be blank")
      end

      it 'shipping_feeが空では登録できない' do
        @item.shipping_fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping_fee can't be blank")
      end
     
      it 'shipping_areaが空では登録できない' do
        @item.shipping_area = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping_area can't be blank")
      end

      it 'shipping_dateが空では登録できない' do
        @item.shipping_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping_date can't be blank")
      end
 
      it 'userが空では登録できない' do
        @item.user = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("User can't be blank")
      end
      


      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = 123456
        @user.password_confirmation = 123456
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end

      it 'passwordが英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end

      it 'passwordが全角では登録できないこと' do
        @item.password = 'AB１２３４'
        @item.password_confirmation = 'AB１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Password is invalid")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @item.save
        another_item = FactoryBot.build(:user, email: @user.email)
        another_item.valid?
        expect(another_item.errors.full_messages).to include ("Email has already been taken")
      end

end


#Price is invalid. Input half-width characters
#Price is out of setting range
#ログイン状態のユーザーのみ、商品出品ページへ遷移できること
#ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること
#商品画像を1枚つけることが必須であること
#販売価格は、¥300~¥9,999,999の間のみ保存可能であること
#販売価格は半角数字のみ保存可能であること
#入力された販売価格によって、販売手数料や販売利益の表示が変わること
#必要な情報を適切に入力すると、商品情報がデータベースに保存されること
#エラーハンドリングができていること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること）
#エラーハンドリングの際、1つのエラーに対して同じエラーメッセージが重複して表示されないこと
