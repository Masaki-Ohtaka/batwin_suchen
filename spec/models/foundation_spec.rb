require 'rails_helper'

RSpec.describe Foundation, type: :model do
  before do
    @foundation = FactoryBot.build(:foundation)
    sleep 0.5
  end
  describe '施設新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@foundation).to be_valid
      end
      it 'building_nameが空でも登録できること' do
        @foundation.building_name = ''
        expect(@foundation).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @foundation.password = 'a1a1a1'
        @foundation.password_confirmation = 'a1a1a1'
        expect(@foundation).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'facility_nameが空では登録できない' do
        @foundation.facility_name = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("施設名を入力してください")
      end
      it 'emailが空では登録できない' do
        @foundation.email = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @foundation.password = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @foundation.password_confirmation = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @foundation.password = '00000'
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @foundation.save
        another_foundation = FactoryBot.build(:foundation)
        another_foundation.email = @foundation.email
        another_foundation.valid?
        expect(another_foundation.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'postal_codeが空だと登録できないこと' do
        @foundation.postal_code = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeは全角数字では登録できないこと' do
        @foundation.postal_code = '１２３４-５６７'
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("郵便番号が認識できません.半角英数字とハイフン（-）を含めてください")
      end
      it 'postal_codeが半角のハイフンを含んだ形式でないと登録できないこと' do
        @foundation.postal_code = '1234567'
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("郵便番号が認識できません.半角英数字とハイフン（-）を含めてください")
      end
      it 'location_idが「---」を選択している時登録できないこと' do
        @foundation.location_id = 0
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'municipalityが空だと登録できないこと' do
        @foundation.municipality = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("市区町村を入力してください")  
      end
      it 'addressが空だと登録できないこと' do
        @foundation.address = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと登録できないこと' do
        @foundation.phone_number = ''
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberは11桁以上だと登録できないこと' do
        @foundation.phone_number = '1234567891011'
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("電話番号が認識できません. 半角数字で入力してください")
      end
      it 'phone_numberは全角数字だと登録できないこと' do
        @foundation.phone_number = '１２３４５６７'
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("電話番号が認識できません. 半角数字で入力してください")
      end
      it 'phone_numberは英数混合だと登録できないこと' do
        @foundation.phone_number = '1234567ai'
        @foundation.valid?
        expect(@foundation.errors.full_messages).to include("電話番号が認識できません. 半角数字で入力してください")
      end 
    end
  end
end