require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.5
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'building_nameが空でも登録できること' do
        @user.building_name = ''
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'a1a1a1'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'gender_idが空だと登録できないこと' do
         @user.gender_id = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("性別を入力してください")
       end

       it 'gender_idは1,2以外だと登録できないこと' do
        @user.gender_id = 3
        @user.valid?
        expect(@user.errors.full_messages).to include("性別は不正値です。男性か女性を選んで下さい")
      end
      
      it 'profileが空だと登録できないこと' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("職業を入力してください")
      end
      it 'postal_codeが空だと登録できないこと' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeは全角数字では登録できないこと' do
        @user.postal_code = '１２３４-５６７'
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号が認識できません.半角英数字とハイフン（-）を含めてください")
      end
      it 'postal_codeが半角のハイフンを含んだ形式でないと登録できないこと' do
        @user.postal_code = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("郵便番号が認識できません.半角英数字とハイフン（-）を含めてください")
      end
      it 'location_idが空だと登録できないこと' do
        @user.location_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'location_idが「---」を選択している時登録できないこと' do
        @user.location_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'location_idが1~47の該当外を入力している時登録できないこと' do
        @user.location_id = 300
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'municipalityが空だと登録できないこと' do
        @user.municipality = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("市区町村を入力してください")  
      end
      it 'addressが空だと登録できないこと' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと登録できないこと' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberは11桁以上だと登録できないこと' do
        @user.phone_number = '1234567891011'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号が認識できません. 半角数字で入力してください")
      end
      it 'phone_numberは全角数字だと登録できないこと' do
        @user.phone_number = '１２３４５６７'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号が認識できません. 半角数字で入力してください")
      end
      it 'phone_numberは英数混合だと登録できないこと' do
        @user.phone_number = '1234567ai'
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号が認識できません. 半角数字で入力してください")
      end 
    end
  end
end

